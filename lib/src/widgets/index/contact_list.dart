import 'dart:async';
import 'package:flutter/material.dart';

import 'package:draggable_scrollbar_sliver/draggable_scrollbar_sliver.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import 'package:contacts/src/models/contact_model.dart';
import 'package:contacts/src/pages/contact_info.dart';

class ContactList extends StatelessWidget {
  final ContactModelList contactList = ContactModelList();

  @override
  Widget build(BuildContext context) {
    var contactGroups = contactList.groupByFirstLetter();
    ScrollController controller = ScrollController();

    return DraggableScrollbar(
      controller: controller,
      child: CustomScrollView(
        slivers: List.generate(contactGroups.length, (i) {
          return _StickyHeaderContactList( contactGroups[i] );
        }),
        controller: controller,
      ),
      heightScrollThumb: 90.0,
      backgroundColor: Color(0xff5F6267),
      scrollThumbBuilder: (
        Color backgroundColor,
        Animation<double> thumbAnimation,
        Animation<double> labelAnimation,
        double height, 
        {
          Text labelText,
          BoxConstraints labelConstraints,
        }
      ) {
        return FadeTransition(
          opacity: thumbAnimation,
          child: Container(
            height: height,
            width: 8.0,
            color: backgroundColor,
          ),
        );
      },
    );
  }
}

class _StickyHeaderContactList extends StatelessWidget {
  final Map<String, dynamic> contactGroup;

  _StickyHeaderContactList(this.contactGroup);
  @override
  Widget build(BuildContext context) {
    final letter = this.contactGroup["firstLetterContact"];

    return SliverStickyHeader(
      overlapsContent: true,
      header: _SideHeader(letter: letter),
      sliver: SliverPadding(
        padding: const EdgeInsets.only(left: 65),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate((context, i) {
            return _Contact(this.contactGroup["contacts"][i], letter);
          },
          childCount: this.contactGroup["contacts"].length,
          ),
        )
      ),
    );
  }
}

class _SideHeader extends StatelessWidget {
  final String letter;
  
  const _SideHeader({ this.letter });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Text(
        letter,
        style: TextStyle(
          fontSize: 17,
          color: Colors.blue,
          fontWeight: FontWeight.bold
        ),
      )
    );
  }
}

class _Contact extends StatelessWidget {
  final Map<String, dynamic> contact;
  final String letter;

  _Contact(this.contact, this.letter);

  @override
  Widget build(BuildContext context) {
    final firstname = this.contact["firstname"];
    final secondname = this.contact["secondname"];
    final lastname = this.contact["lastname"];
    final color = this.contact["color"];
    
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Timer(Duration(milliseconds: 100), (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ContactInfo()));
          });
        },
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: color,
            foregroundColor: Colors.white,
            child: Text(
              this.letter,
              style: TextStyle(
                fontSize: 27
              ),
            ),
          ),
          title: Text( 
            '$firstname $secondname $lastname',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
