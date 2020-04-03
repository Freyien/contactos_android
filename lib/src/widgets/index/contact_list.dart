import 'package:flutter/material.dart';
import 'package:contacts/src/models/contact_model.dart';
import 'package:contacts/src/utils/colors_utils.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class ContactList extends StatelessWidget {
  final ContactModelList contactList = ContactModelList();

  @override
  Widget build(BuildContext context) {
    var contactGroups = contactList.groupByFirstLetter();

    return CustomScrollView(
      slivers: List.generate(contactGroups.length, (i) {
        return _StickyHeaderContactList( contactGroups[i] );
      })
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
    
    return Row(
      children: <Widget>[
        Expanded(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: randomColor(),
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
      ],
    );
  }
}
