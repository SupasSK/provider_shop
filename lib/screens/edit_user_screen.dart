import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_profile_provider.dart';

class EditUserScreen extends StatefulWidget {
  static const routeName = '/edit-user';
  const EditUserScreen({super.key});

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameCtrl;

  @override
  void initState() {
    super.initState();
    final current = WidgetsBinding.instance; // ให้ build เสร็จก่อนแล้วค่อยอ่าน context
    current.addPostFrameCallback((_) {
      final now = context.read<UserProfileProvider>().username;
      _nameCtrl.text = now;
      setState(() {});
    });
    _nameCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  void _save() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    context.read<UserProfileProvider>().changeUsername(_nameCtrl.text.trim());
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แก้ไขชื่อผู้ใช้'),
        actions: [
          IconButton(icon: const Icon(Icons.save), onPressed: _save),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameCtrl,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'เช่น supas01',
                ),
                textInputAction: TextInputAction.done,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'กรอกชื่อก่อน';
                  if (v.trim().length < 3) return 'ยาวอย่างน้อย 3 ตัวอักษร';
                  return null;
                },
                onFieldSubmitted: (_) => _save(),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _save,
                icon: const Icon(Icons.save),
                label: const Text('บันทึก'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
