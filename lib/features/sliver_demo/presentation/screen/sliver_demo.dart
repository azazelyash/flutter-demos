import 'package:flutter/material.dart';

class SliverDemo extends StatelessWidget {
  const SliverDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 200,
              surfaceTintColor: Colors.teal,
              automaticallyImplyLeading: true,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  margin: const EdgeInsets.only(bottom: 36),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        spreadRadius: 1,
                        offset: Offset(0, 6),
                        color: Colors.black26,
                      ),
                    ],
                    color: Colors.teal,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Trees",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.nature, color: Colors.white, size: 24),
                    ],
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: TextFormField(
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Search...",
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: Colors.teal.shade300,
                      hintStyle: TextStyle(color: Colors.teal.shade300),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              sliver: SliverList.builder(
                itemCount: 50,
                itemBuilder: (context, index) => ListTile(
                  title: Text("List Name ${index + 1}"),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  tileColor: (index % 2 != 0) ? Colors.teal.withOpacity(0.05) : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
