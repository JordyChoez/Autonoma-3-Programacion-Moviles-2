import 'package:flutter/material.dart';

class IconAndDetail extends StatelessWidget {
  const IconAndDetail(this.icon, this.detail, {super.key});

  final IconData icon;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(
            detail,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}

class Paragraph extends StatelessWidget {
  const Paragraph(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

class StyledButton extends StatelessWidget {
  const StyledButton({super.key, required this.onPressed, required this.child});
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
