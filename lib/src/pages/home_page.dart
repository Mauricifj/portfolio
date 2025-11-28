import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../design_system/design_system.dart';
import 'home/layouts/home_desktop_layout.dart';
import 'home/layouts/home_mobile_layout.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = .generate(4, (_) => GlobalKey());
  int _selectedIndex = 0;
  bool _isAutoScrolling = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isAutoScrolling) return;

    if (_scrollController.hasClients &&
        _scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 50) {
      if (_selectedIndex != _sectionKeys.length - 1) {
        setState(() => _selectedIndex = _sectionKeys.length - 1);
      }
      return;
    }

    int newIndex = 0;
    final double threshold = MediaQuery.of(context).size.height / 2;

    for (int i = 0; i < _sectionKeys.length; i++) {
      final context = _sectionKeys[i].currentContext;
      if (context == null) continue;

      final RenderBox box = context.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero);

      if (position.dy < threshold) {
        newIndex = i;
      }
    }

    if (_selectedIndex != newIndex) {
      setState(() => _selectedIndex = newIndex);
    }
  }

  Future<void> _scrollToSection(int index) async {
    setState(() {
      _selectedIndex = index;
      _isAutoScrolling = true;
    });

    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }

    if (mounted) {
      setState(() {
        _isAutoScrolling = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: HomeMobileLayout(
        scrollController: _scrollController,
        sectionKeys: _sectionKeys,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _scrollToSection,
      ),
      desktop: HomeDesktopLayout(
        scrollController: _scrollController,
        sectionKeys: _sectionKeys,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _scrollToSection,
      ),
    );
  }
}
