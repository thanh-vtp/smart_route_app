import 'package:flutter/material.dart';

class ReviewLocationCard extends StatelessWidget {
  const ReviewLocationCard({super.key, required this.name, required this.info});

  final String name;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Dùng Container bọc Card để chỉnh margin
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!), // Viền mỏng màu xám
        borderRadius: BorderRadius.circular(12),
        // boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))], // Bật nếu muốn đổ bóng
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Tên địa điểm + Menu 3 chấm
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, // Cắt bớt nếu tên quá dài
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.more_vert, size: 20, color: Colors.grey[600]),
              ],
            ),

            SizedBox(height: 4),

            // 2. Thông tin ghé thăm (Subtitle)
            Text(
              info,
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            SizedBox(height: 20),

            // 3. Dòng Call to Action: "Xếp hạng..." và "Bỏ qua"
            Row(
              children: [
                Text(
                  "Xếp hạng địa điểm này",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Spacer(), // Đẩy chữ "Bỏ qua" sang phải
                InkWell(
                  // Dùng InkWell để có hiệu ứng ripple khi bấm
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Text(
                      "Bỏ qua",
                      style: TextStyle(
                        color: Colors.blue[700], // Màu xanh đặc trưng Google
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // 4. Hàng 5 ngôi sao (Rating Bar)
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Chia đều khoảng cách
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star_border_rounded, // Icon sao rỗng, bo tròn góc
                  size: 40, // Kích thước lớn như hình
                  color: Colors.grey[500],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
