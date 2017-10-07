package com.users.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

public class Checkcode {
	
	//产生随机字体,下面的方法会调用
	private Font getFont(){
		//创建random对象，用于生成随机数
		Random random = new Random();
		//创建字体数组，用于封装不同的字体的Font对象
		/*Font font[] = new Font[5];
		font[0] = new Font("Ravie",Font.PLAIN,20);
		font[1] = new Font("Antique Olive Compat",Font.PLAIN,20);
		font[2] = new Font("Forte",Font.PLAIN,25);
		font[3] = new Font("Wide Latin",Font.PLAIN,20);
		font[4] = new Font("Gill Sans Ultra Bold",Font.PLAIN,20);
		return font[random.nextInt(5)];*/
		
		Font font[] = new Font[3];
		font[0] = new Font("Times New Roman",Font.BOLD,22);
		font[1] = new Font("Antique Olive Compat",Font.BOLD,26);
		font[2] = new Font("Forte",Font.BOLD,24);
		return font[random.nextInt(3)];
	}
	
	// 写一个方法
	public Color getRandColor(int fc, int bc) {// 给定范围获得随机颜色
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;

		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);

		return new Color(r, g, b);
	}
	
	
	//生成验证码
	public String getCode(){
		//获取HttpServletResponse对象
		HttpServletResponse response = ServletActionContext.getResponse();
		
		// 设置页面不缓存
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		
		//设置响应头Content-type类型
		response.setContentType("image/jpeg");
		try {
			OutputStream os = response.getOutputStream();
			int width = 85, height = 28;
			//创建一个图片缓冲区，建立指定宽、高的BufferedImage对象
			BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_BGR);
			Graphics g = image.getGraphics();//该画笔在image上绘制
			Color c = g.getColor();//保存当前画笔的颜色
			
			// 设定背景色
			g.setColor(getRandColor(200, 250));//调用了getRandColor方法
			//填充矩形
			g.fillRect(0, 0, width, height);
			
			// // 画边框，设置了背景色就没必要画边框了
			// g.setColor(new Color(0, 0, 0));
			// g.drawRect(0, 0, width - 1, height - 1);// 细线围成的边框范围
			
			//放到外面公用
			Random random = new Random();

			// 随机产生155条干扰线，使图象中的认证码不易被其它程序探测到
			for (int i = 0; i < 50; i++) {
				int x = random.nextInt(width);
				int y = random.nextInt(height);
				int xl = random.nextInt(12);
				int yl = random.nextInt(12);
				g.setColor(getRandColor(160, 200));//设置干扰线的颜色
				g.drawLine(x, y, x + xl, y + yl);
			}
			
			//------------------------------------------------------------------------------
			//方式一：
			/*//.toCharArray()将字符串转为字符数组
			char[] ch = "abcAdefghjklmnpqruv234st56789wxyz".toCharArray();//不包括o,0,1,l,i
			int length = ch.length;
			String srand = ""; //保存随机产生的字符串
			
			
			for(int i=0;i<4;i++){
				//设置字体
				g.setFont(getFont());//自己写的方法getFont()
				//随机生成0-9的数字,
				//random.nextInt()与random.nextInt(length)
				String rand = new Character(ch[random.nextInt(length)]).toString();
				srand += rand;
				
				//设置随机颜色，random.nextInt(120)里的数字小一点，颜色会深一些
				g.setColor(new Color(random.nextInt(120),random.nextInt(120),random.nextInt(120)));
//				g.setColor(new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255)));
				
				g.drawString(rand, 20*i + 6, 20);//应该是画出来，并且设置了高低位置
				
			}*/
			//------------------------------------------------------------------------------
			
			
			//------------------------------------------------------------------------------	
			//方式二：，自动生成数字和字母
			// 取随机产生的认证码(4位数字)
			String srand = "";
			for (int i = 0; i < 4; i++) {
				String rand = null;
				//设置字体
				g.setFont(getFont());//自己写的方法getFont()

				/*// 随机生成数字或者小写字母
				if (random.nextInt(10) > 5) {
					rand = String.valueOf((char) (random.nextInt(10) + 48));
				} else {
					rand = String.valueOf((char) (random.nextInt(26) + 65));
				}*/
				
				//改进：自动生成大小写字母和数字
				if (random.nextInt(12) < 4) {
					rand = String.valueOf((char) (random.nextInt(8)+2 + 48)); //不要0和1
				} else if(random.nextInt(12) < 8) {
					rand = String.valueOf((char) (random.nextInt(26) + 65));
				} else{
					rand = String.valueOf((char) (random.nextInt(26) + 97));
					
				}

				srand += rand;

				// 设置随机颜色，random.nextInt(120)里的数字小一点，颜色会深一些
				g.setColor(new Color(random.nextInt(120), random.nextInt(120), random.nextInt(120)));
				g.drawString(rand, 20 * i + 6, 20);// 应该是画出来，并且设置了高低位置

			} // for循环结束
		//------------------------------------------------------------------------------
			
			//产生随机干扰点
			g.setColor(new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255)));
			for(int i=0;i<55;i++){
				int x1 = random.nextInt(width);
				int y1 = random.nextInt(height);
				g.drawOval(x1, y1, 1, 1);
//				g.drawOval(x1, y1, 2, 2);//2表示点的大小
			}
			
			
			
			
			
			
			//重新设置画笔的颜色
			g.setColor(c);
			
			//释放此图形的上下文以及它所使用的所有系统资源
			g.dispose();
			
			//获取HttpServletRequest对象
			HttpServletRequest request = ServletActionContext.getRequest();
			//将验证码记录到session中
			request.getSession().setAttribute("safecode", srand);
			
			//输出图像到页面
			ImageIO.write(image, "JPEG", os);//OutputStream os = response.getOutputStream();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;//不需要返回，因为ImageIO.write已经写好了，也不用配置<result>了，但<action>要写
		
	}
	

}
