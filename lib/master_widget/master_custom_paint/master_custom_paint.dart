import 'package:flutter/material.dart';

class MasterCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final zeroPointThreeH = h * .3;
    final theOtherH = h * .7;

    final path = Path();
    final paint = Paint()
      // ..color = const Color(0xffD9D9D9)
      ..color = Colors.black
      ..strokeWidth = 1.3
      ..style = PaintingStyle.stroke;

    // Perbedaan relativeLineTo & lineTo dengan
    // lineTo : membuat garis dengan titik akhir berakhir di titik yang developer input
    // relativeLineTo : membuat garis dengan titik akhir berakhir di titik yang jarak x dan y nya sesuai dengan developer input
    // path.moveTo(50, 50);
    // path.relativeLineTo(0, 50);
    // path.lineTo(100, 150);
    // path.relativeLineTo(50, 0);

    // intinya: relative menggunakan dx dan dy. Sedangkan yang bukan relative menggunakan x dan y.

    // contoh moveTo & relativeMoveTo:
    // Resultnya adalah gambar 'E'
    // path.moveTo(30, 55);
    // path.relativeQuadraticBezierTo(20, 20, 0, 40);
    // path.relativeMoveTo(30, -60);
    // path.relativeQuadraticBezierTo(40, 40, 0, 80);
    // path.relativeMoveTo(30, -100);
    // path.relativeQuadraticBezierTo(40, 60, 0, 120);

    // experiment untuk menjalankan case vertical & horizontal Lines
    // Result dari path ini adalah gambar Rumah.
    // Vertical = x; Horizontal = y
    // nilai vertical & horizontal dipengaruhi juga dengan nilai relative vertical dan 
    // horizontalnya. Setiap perubahan dari nilai relative dan ditambahkan ke 
    // nilai vertical/horizontalnya akan menjadikan nilai vertical/horizotal
    // terkininya. 
    var horizontalValue = 50.0;
    var relativeHorizontalValue = 25.0;
    var verticalValue = 100.0;
    var relativeVerticalValue = -50.0;

    path.moveTo(horizontalValue, verticalValue); // Move

    path.relativeLineTo(relativeHorizontalValue, relativeVerticalValue); // relative line
    
    relativeHorizontalValue = 100;
    relativeVerticalValue = 0;
    path.relativeLineTo(relativeHorizontalValue, relativeVerticalValue); // relative horizontal line

    relativeHorizontalValue = 25;
    relativeVerticalValue = 50;
    verticalValue = verticalValue + relativeVerticalValue; 
    path.relativeLineTo(relativeHorizontalValue, relativeVerticalValue); // relative line

    relativeHorizontalValue = -125;
    relativeVerticalValue = 0;
    path.relativeLineTo(relativeHorizontalValue, relativeVerticalValue); // relative line

    relativeHorizontalValue = 0;
    relativeVerticalValue = 100;
    verticalValue = verticalValue + relativeVerticalValue; 
    path.relativeLineTo(relativeHorizontalValue, relativeVerticalValue); // relative line

    relativeHorizontalValue = 50;
    relativeVerticalValue = 0;
    path.relativeLineTo(relativeHorizontalValue, relativeVerticalValue); // relative line

    relativeHorizontalValue = 0;
    relativeVerticalValue = -50;
    verticalValue = verticalValue + relativeVerticalValue; 
    path.relativeLineTo(relativeHorizontalValue, relativeVerticalValue); // relative line

    horizontalValue = 100;
    verticalValue = verticalValue + relativeVerticalValue;
    path.lineTo(horizontalValue, verticalValue); // horizontal line

    relativeHorizontalValue = 0;
    relativeVerticalValue = 50;
    path.relativeLineTo(relativeHorizontalValue, relativeVerticalValue); // relative line

    relativeHorizontalValue = 75;
    relativeVerticalValue = 0;
    path.relativeLineTo(relativeHorizontalValue, relativeVerticalValue); // relative Horizontal line

    relativeHorizontalValue = 0;
    relativeVerticalValue = -100;
    path.relativeLineTo(relativeHorizontalValue, relativeVerticalValue); // relative Horizontal line
    path.close();

/*
    var horizontalValue = 130.0;
    var relativeHorizontalValue = 0.0;
    var verticalValue = 50.0;
    var relativeVerticalValue = 0.0;
    
    path.moveTo(horizontalValue, verticalValue); // Move
    
    relativeHorizontalValue = -60;
    path.relativeLineTo(relativeHorizontalValue, relativeVerticalValue); // relative horizontal line
    
    horizontalValue = horizontalValue + relativeHorizontalValue;
    verticalValue = 150;
    path.lineTo(horizontalValue, verticalValue); // Vertical line
    
    horizontalValue = 130; 
    path.lineTo(horizontalValue, verticalValue); // Horizontal line

    horizontalValue = 70;
    verticalValue = 100;
    path.moveTo(horizontalValue, verticalValue); // Move

    relativeHorizontalValue = 40;
    path.relativeLineTo(relativeHorizontalValue, relativeVerticalValue); // relative horizontal line
*/

    // path.moveTo(0, 10); // Berpindah titik dari titik 0.0 ke 0,10
    // path.lineTo(0, zeroPointThreeH);
    // path.arcToPoint(
    //   Offset(0, theOtherH),
    //   radius: const Radius.circular(10),
    //   clockwise: true,
    // );
    // path.quadraticBezierTo(0, h, 10, h); 
    // path.lineTo(w - 10, h); // old : path.lineTo(w, h);
    // path.quadraticBezierTo(w, h, w, theOtherH); // o: path.lineTo(w, theOtherH);
    // path.arcToPoint(
    //   Offset(w, zeroPointThreeH),
    //   radius: const Radius.circular(10),
    //   clockwise: true,
    // );
    // path.quadraticBezierTo(w, 0, w - 10, 0); // old: path.lineTo(w, 0);
    // path.lineTo(10, 0); // new
    // path.quadraticBezierTo(0, 0, 0, 10); // new
    
    // path.close(); // line untuk menyatukan titik awal dan titik akhir dengan menggunakan garis lurus

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ReusableCustomPain extends StatelessWidget {
  const ReusableCustomPain({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width / 2,
      child: CustomPaint(
        painter: MasterCustomPaint(),
        child: SizedBox(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              // VourcherTileTitle(),
              // Icon(Icons.abc_sharp, size: 45),
            ],
          ),
        ),
      ),
    );
  }
}

class VourcherTileTitle extends StatelessWidget {
  const VourcherTileTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.favorite),
        SizedBox(width: 17.5),
        Text('Punya kode voucher?')
      ],
    );
  }
}
