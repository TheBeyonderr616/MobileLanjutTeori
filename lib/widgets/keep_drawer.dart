import 'package:flutter/material.dart';
import 'package:mobile_lanjut_utp/constants/app_colors.dart';
import 'package:mobile_lanjut_utp/pages/archive_page.dart';
import 'package:mobile_lanjut_utp/pages/reminders_page.dart';
import 'package:mobile_lanjut_utp/pages/trash_page.dart';

// Drawer (menu samping)
class KeepDrawer extends StatelessWidget {
  final String current; // 'catatan', 'arsip', 'pengingat', atau 'sampah'
  const KeepDrawer({super.key, required this.current});

  Widget _item(
    BuildContext context, {
    required IconData icon,
    required String label,
    bool selected = false,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, bottom: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: onTap ?? () => Navigator.pop(context),
        child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: selected ? kGreenDark : Colors.transparent,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            children: [
              Icon(icon, color: selected ? kGreenAccent : Colors.white70),
              const SizedBox(width: 28),
              Text(
                label,
                style: TextStyle(
                  fontSize: 17,
                  color: selected ? kGreenAccent : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kBackground,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 12, top: 12),
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 12, 12, 24),
              child: Text(
                'Google Keep',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
              ),
            ),

            // Menu: Catatan -> kembali ke Beranda
            _item(
              context,
              icon: Icons.lightbulb_outline,
              label: 'Catatan',
              selected: current == 'catatan',
              onTap: () {
                Navigator.pop(context);
                if (current != 'catatan') {
                  Navigator.popUntil(context, (route) => route.isFirst);
                }
              },
            ),
            _item(
              context,
              icon: Icons.notifications_none,
              label: 'Pengingat',
              selected: current == 'pengingat',
              onTap: () {
                Navigator.pop(context);
                if (current != 'pengingat') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RemindersPage()),
                  );
                }
              },
            ),
            _item(context, icon: Icons.add, label: 'Buat label baru'),
            // Menu: Arsip -> buka ArchivePage
            _item(
              context,
              icon: Icons.archive_outlined,
              label: 'Arsip',
              selected: current == 'arsip',
              onTap: () {
                Navigator.pop(context);
                if (current != 'arsip') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ArchivePage()),
                  );
                }
              },
            ),
            // Menu: Sampah -> buka TrashPage
            _item(
              context,
              icon: Icons.delete_outline,
              label: 'Sampah',
              selected: current == 'sampah',
              onTap: () {
                Navigator.pop(context);
                if (current != 'sampah') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const TrashPage()),
                  );
                }
              },
            ),
            _item(context, icon: Icons.settings_outlined, label: 'Setelan'),
            _item(context, icon: Icons.help_outline, label: 'Bantuan & masukan'),
          ],
        ),
      ),
    );
  }
}
