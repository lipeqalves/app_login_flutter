import 'package:flutter/material.dart';

class ContainerImage extends StatefulWidget {
  const ContainerImage({
    super.key,
    required List<Center> children,
  });

  @override
  State<ContainerImage> createState() => _ContainerImageState();
}

class _ContainerImageState extends State<ContainerImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://images.unsplash.com/photo-1536147210925-5cb7a7a4f9fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwcm9maWxlLXBhZ2V8Nnx8fGVufDB8fHx8&w=1000&q=80'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
