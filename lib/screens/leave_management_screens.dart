import 'package:flutter/material.dart';

class LeaveManagementScreen extends StatefulWidget {
  const LeaveManagementScreen({Key? key}) : super(key: key);

  @override
  State<LeaveManagementScreen> createState() => _LeaveManagementScreenState();
}

class _LeaveManagementScreenState extends State<LeaveManagementScreen> {
  @override
  Widget build(BuildContext context) {
    // الألوان المستعملة - عدّلها لو حاب
    const bg = Color(0xFFF2E9D6); // بيج خفيف خلفية
    const teal = Color(0xFF0F5160); // لون العنوان الداكن
    const cardShadow = Color(0xFFBFD6CC);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: bg,
        body: SafeArea(
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                // --- رأس الصفحة مخصص مع شكل منحني يسار ---
                _buildTopBar(teal),
                const SizedBox(height: 12),

                // --- بطاقتا الأرقام ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(child: _buildNumberCard('إجمالي الموظفين', '30')),
                      const SizedBox(width: 12),
                      Expanded(child: _buildNumberCard('طلبات معلّقة', '4')),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // --- تبويبات داخل صندوق مستدير (pill tabs) ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: const Color(0xFFBEE0D4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelColor: teal,
                      unselectedLabelColor: Colors.black54,
                      tabs: const [
                        Tab(text: 'رصيد الإجازات'),
                        Tab(text: 'طلبات الإجازات'),
                        Tab(text: 'التقويم'),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // --- محتوى التبويبات ---
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      // صندوق المحتوى الأبيض
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: TabBarView(
                        children: [
                          // =========== Tab 1: رصيد الإجازات ===========
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // بحث
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'البحث عن موظف...',
                                    prefixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                                  ),
                                ),
                                const SizedBox(height: 12),

                                // مثال بطاقة موظف - كرر حسب الحاجة
                                _employeeBalanceCard(
                                  name: 'اسم موظف',
                                  dept: 'قسم: تقنية المعلومات',
                                  annualTotal: 30,
                                  available: 18,
                                  used: 12,
                                ),
                                const SizedBox(height: 8),
                                _employeeBalanceCard(
                                  name: 'اسم موظف',
                                  dept: 'قسم: الموارد البشرية',
                                  annualTotal: 30,
                                  available: 5,
                                  used: 25,
                                ),
                                const SizedBox(height: 8),
                                _employeeBalanceCard(
                                  name: 'اسم موظف',
                                  dept: 'قسم: المالية',
                                  annualTotal: 30,
                                  available: 10,
                                  used: 20,
                                ),

                                const SizedBox(height: 30),
                                // مسافة نهاية الصفحة
                              ],
                            ),
                          ),

                          // =========== Tab 2: طلبات الإجازات ===========
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // شريط الفلترة / علامة الحالة
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFF3D9),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text('المعلقة (4)'),
                                  ),
                                ),
                                const SizedBox(height: 8),

                                // مثال صف طلب إجازة
                                _leaveRequestRow(
                                  name: 'اسم الموظف',
                                  type: 'إجازة سنوية',
                                  from: '2025-12-01',
                                  to: '2025-12-06',
                                  days: 6,
                                  status: 'قبول',
                                ),
                                const SizedBox(height: 6),
                                _leaveRequestRow(
                                  name: 'اسم الموظف',
                                  type: 'إجازة مرضية',
                                  from: '2025-10-13',
                                  to: '2025-10-14',
                                  days: 2,
                                  status: 'رفض',
                                ),
                                const SizedBox(height: 6),
                                _leaveRequestRow(
                                  name: 'اسم الموظف',
                                  type: 'إجازة رسمية',
                                  from: '2025-11-08',
                                  to: '2025-11-09',
                                  days: 2,
                                  status: 'قبول',
                                ),
                                // كرر أو ضع ListView.builder عند الربط بالبيانات
                                const SizedBox(height: 30),
                              ],
                            ),
                          ),

                          // =========== Tab 3: التقويم ===========
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text('أكتوبر 2025', style: TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(height: 12),
                                // صندوق التقويم - placeholder
                                Container(
                                  height: 320,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(Icons.calendar_month, size: 56, color: Colors.grey),
                                        SizedBox(height: 8),
                                        Text('تقويم الإجازات المجدولة لشهر أكتوبر', textAlign: TextAlign.center),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                // بطاقة مثال داخل التقويم
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    children: const [
                                      Text('الإجازات المجدولة لشهر أكتوبر 2025', style: TextStyle(fontWeight: FontWeight.bold)),
                                      SizedBox(height: 8),
                                      Text('25-19 أكتوبر\nاسم الموظف\nإجازة سنوية (7 أيام)', textAlign: TextAlign.center),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ----- ويدجت رأس الصفحة -----
  Widget _buildTopBar(Color teal) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 84,
        child: Stack(
          children: [
            // الخلفية المنحنية
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: teal,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(6),
                  ),
                ),
              ),
            ),
            // زر العودة ونص العنوان
            Positioned.fill(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.maybePop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                    color: Colors.white,
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'إدارة الإجازات',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // مسافة لإبقاء التماثل مع زر العودة
                ],
              ),
            ),
          ],
        ),
      ),
    );
