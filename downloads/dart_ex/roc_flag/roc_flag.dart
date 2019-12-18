import 'dart:html';
import 'dart:math' as Math;

CanvasElement canvas;
CanvasRenderingContext2D ctx;
int flag_w = 300;
int flag_h = 200;
num circle_x = flag_w / 4;
num circle_y = flag_h / 4;

void main() {
  canvas = querySelector('#canvas');
  ctx = canvas.getContext('2d');

  drawROC(ctx);
  querySelector("#roc").onClick.listen((e) => drawROC(ctx));
  querySelector("#usa").onClick.listen((e) => drawUSA(ctx));
  querySelector("#button").onClick.listen((e) => clearCanvas());
}
  
  drawStar(cx, cy, spikes, outerRadius, innerRadius) {
    var rot = Math.pi / 2 * 3;
    var x = cx;
    var y = cy;
    var step = Math.pi / spikes;

    ctx.fillStyle = '#fff';
    ctx.beginPath();
    ctx.moveTo(cx, cy - outerRadius);
    for (int i = 0; i < spikes; i++) {
        x = cx + Math.cos(rot) * outerRadius;
        y = cy + Math.sin(rot) * outerRadius;
        ctx.lineTo(x, y);
        rot += step;

        x = cx + Math.cos(rot) * innerRadius;
        y = cy + Math.sin(rot) * innerRadius;
        ctx.lineTo(x, y);
        rot += step;
    }
    ctx.lineTo(cx, cy - outerRadius);
    ctx.closePath();
    ctx.lineWidth=5;
    ctx.strokeStyle='white';
    ctx.stroke();
    ctx.fillStyle='white';
    ctx.fill();

}


void drawUSA(ctx){
  //紅底
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(255, 0, 0)';
  ctx.fillRect(0, 0, flag_w, flag_h);
  //白線
  ctx.fillStyle = 'rgb(255, 255, 255)';
  ctx.fillRect(0, 15.3, flag_w, flag_h/13);
  ctx.fillRect(0, 45.9, flag_w, flag_h/13);
  ctx.fillRect(0, 75.5, flag_w, flag_h/13);
  ctx.fillRect(0, 106.1, flag_w, flag_h/13);
  ctx.fillRect(0, 136.7, flag_w, flag_h/13);
  ctx.fillRect(0, 167.3, flag_w, flag_h/13);
  //籃底
  ctx.fillStyle = 'rgb(0, 0, 140)';
  ctx.fillRect(0, 0, 150,106.1 );
  //星星
  drawStar(14, 17, 5, 5, 2.5);
  drawStar(38, 17, 5, 5, 2.5);
  drawStar(62, 17, 5, 5, 2.5);
  drawStar(88, 17, 5, 5, 2.5);
  drawStar(112, 17, 5, 5, 2.5);
  drawStar(136, 17, 5, 5, 2.5);
  
  drawStar(25, 36, 5, 5, 2.5);
  drawStar(50, 36, 5, 5, 2.5);
  drawStar(75, 36, 5, 5, 2.5);
  drawStar(100, 36, 5, 5, 2.5);
  drawStar(125, 36, 5, 5, 2.5);
  
  drawStar(14, 54, 5, 5, 2.5);
  drawStar(38, 54, 5, 5, 2.5);
  drawStar(62, 54, 5, 5, 2.5);
  drawStar(88, 54, 5, 5, 2.5);
  drawStar(112, 54, 5, 5, 2.5);
  drawStar(136, 54, 5, 5, 2.5);
  
  drawStar(25, 71, 5, 5, 2.5);
  drawStar(50, 71, 5, 5, 2.5);
  drawStar(75, 71, 5, 5, 2.5);
  drawStar(100, 71, 5, 5, 2.5);
  drawStar(125, 71, 5, 5, 2.5);
  
  drawStar(14, 88, 5, 5, 2.5);
  drawStar(38, 88, 5, 5, 2.5);
  drawStar(62, 88, 5, 5, 2.5);
  drawStar(88, 88, 5, 5, 2.5);
  drawStar(112, 88, 5, 5, 2.5);
  drawStar(136, 88, 5, 5, 2.5);
} 
  void drawROC(ctx){
  // 先畫滿地紅
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(255, 0, 0)';
  ctx.fillRect(0, 0, flag_w, flag_h);
  // 再畫青天
  ctx.fillStyle = 'rgb(0, 0, 150)';
  ctx.fillRect(0, 0, flag_w / 2, flag_h / 2);
  // 畫十二道光芒白日
  ctx.beginPath();
  num star_radius = flag_w / 8;
  num angle = 0;
  for (int i = 0; i < 25; i++) {
    angle += 5 * Math.pi * 2 / 12;
    num toX = circle_x + Math.cos(angle) * star_radius;
    num toY = circle_y + Math.sin(angle) * star_radius;
    // 只有 i 為 0 時移動到 toX, toY, 其餘都進行 lineTo
    if (i != 0)
      ctx.lineTo(toX, toY);
    else
      ctx.moveTo(toX, toY);
  }
  ctx.closePath();
  // 將填色設為白色
  ctx.fillStyle = '#fff';
  ctx.fill();
  // 白日:藍圈
  ctx.beginPath();
  ctx.arc(circle_x, circle_y, flag_w * 17 / 240, 0, Math.pi * 2, true);
  ctx.closePath();
  // 填色設為藍色
  ctx.fillStyle = 'rgb(0, 0, 149)';
  ctx.fill();
  //白日:白心
  ctx.beginPath();
  ctx.arc(circle_x, circle_y, flag_w / 16, 0, Math.pi * 2, true);
  ctx.closePath();
  // 填色設為白色
  ctx.fillStyle = '#fff';
  ctx.fill();
}

void clearCanvas(){
  ctx.clearRect(0, 0, flag_w, flag_h);
}
