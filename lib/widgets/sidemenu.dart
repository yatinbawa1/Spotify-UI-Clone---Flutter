import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      color: Theme.of(context).primaryColor,
      height: double.infinity,
      child: Column(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                "assets/spotify_logo.png",
                height: 55.0,
                filterQuality: FilterQuality.high,
              ),
            ),
          ],
        ),
        _SideMenuIcon(
            iconData: Icons.home, title: "Home", callBackOnTap: () {}),
        _SideMenuIcon(
            iconData: Icons.search, title: "Search", callBackOnTap: () {}),
        _SideMenuIcon(
            iconData: Icons.audiotrack, title: "Radio", callBackOnTap: () {}),
        const SizedBox(
          height: 12.0,
        ),
        _LibraryPlaylists(),
      ]),
    );
  }
}

class _SideMenuIcon extends StatelessWidget {
  final IconData iconData;
  final String title;
  final void callBackOnTap;

  const _SideMenuIcon(
      {Key? key,
      required IconData this.iconData,
      required String this.title,
      required void this.callBackOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Colors.white,
        size: 28.0,
      ),
      onTap: () => callBackOnTap,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _LibraryPlaylists extends StatefulWidget {
  const _LibraryPlaylists({Key? key}) : super(key: key);

  @override
  State<_LibraryPlaylists> createState() => _LibraryPlaylistsState();
}

class _LibraryPlaylistsState extends State<_LibraryPlaylists> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        physics: const ClampingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "Your Library",
                  style: Theme.of(context).textTheme.headline2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ...yourLibrary.map((e) => ListTile(
                    dense: true,
                    title: Text(e,
                        style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis),
                    onTap: () {},
                  )).toList(),
            ],
          ),
          const SizedBox(height: 24.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "Playlist",
                  style: Theme.of(context).textTheme.headline2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ...playlists.map((e) => ListTile(
                dense: true,
                title: Text(e,
                    style: Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis),
                onTap: () {},
              )).toList(),
            ],
          )
        ],
      ),
    );
  }
}
