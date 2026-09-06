import 'dart:ui';
import 'package:bookly_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class LiquidGlassNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  const LiquidGlassNavBar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: _GlassNavBar(
            currentIndex: currentIndex,
            onDestinationSelected: onDestinationSelected,
          ),
        ),
      ),
    );
  }
}

class _GlassNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  const _GlassNavBar({
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  static const _items = [
    _NavItem(
      icon: Iconsax.book_copy,
      selectedIcon: Iconsax.book,
      label: 'Home',
    ),
    _NavItem(
      icon: Iconsax.search_normal_copy,
      selectedIcon: Iconsax.search_normal,
      label: 'Search',
    ),
    _NavItem(
      icon: Iconsax.bookmark_copy,
      selectedIcon: Iconsax.bookmark,
      label: 'Favourites',
    ),
    // _NavItem(
    //   icon: 'assets/icons/Profile.svg',
    //   selectedIcon: 'assets/icons/Profile_selected.svg',
    //   label: 'Profile',
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 6),
          // height: 62,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            // Liquid glass layers: white tint + gradient shimmer
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                // kPrimaryColor.withAlpha(10),
                // kPrimaryColor.withAlpha(5),
                // kPrimaryColor.withAlpha(0),
                Colors.white.withAlpha(10),
                Colors.white.withAlpha(5),
                Colors.white.withAlpha(0),
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade200.withAlpha(25),
                width: 1.2,
              ),
              right: BorderSide(
                color: Colors.grey.shade200.withAlpha(25),
                width: 0.4,
              ),
              left: BorderSide(
                color: Colors.grey.shade200.withAlpha(25),
                width: 0.4,
              ),
              // bottom: BorderSide(
              //   color: Colors.grey.shade200.withAlpha(50),
              //   width: 0.1,
              // ),
            ),
            boxShadow: [
              // BoxShadow(
              //   color: Colors.black.withOpacity(0.08),
              //   blurRadius: 24,
              //   offset: const Offset(0, 8),
              // ),
              BoxShadow(
                color: Colors.white.withAlpha(8),
                blurRadius: 1,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              _items.length,
              (index) => _GlassNavItem(
                item: _items[index],
                isSelected: currentIndex == index,
                onTap: () => onDestinationSelected(index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GlassNavItem extends StatelessWidget {
  final _NavItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _GlassNavItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                shape: BoxShape.rectangle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.20),
                    Colors.white.withOpacity(0.1),
                  ],
                ),
                // border: Border.all(
                //   color: AppColors.primaryColor.withOpacity(0.35),
                //   width: 1,
                // ),
                // boxShadow: [
                //   BoxShadow(
                //     color: kPrimaryColor.withOpacity(0.15),
                //     blurRadius: 12,
                //     offset: const Offset(0, 4),
                //   ),
                // ],
              )
            : null,
        child: _buildIcon(),
      ),
    );
  }

  Widget _buildIcon() {
    // Special case: Favourites uses a Material icon when selected
    // if (item.selectedIcon == null) {
    //   return isSelected
    //       ? Icon(Icons.favorite, color: Colors.white, size: 24)
    //       : SvgPicture.asset(
    //           item.icon,
    //           height: 12,
    //           colorFilter: const ColorFilter.mode(
    //             Colors.white54,
    //             BlendMode.srcIn,
    //           ),
    //         );
    // }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: isSelected
          ? Icon(
              item.selectedIcon,
              key: ValueKey('selected_${item.label}'),
              color: Colors.white,
              size: 24,
            )
          : Icon(
              item.icon,
              key: ValueKey('unselected_${item.label}'),
              color: Colors.white54,
              size: 24,
            ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final IconData selectedIcon;
  final String label;

  const _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
}
