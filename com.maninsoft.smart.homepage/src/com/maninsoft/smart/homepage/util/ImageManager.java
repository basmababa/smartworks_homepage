package com.maninsoft.smart.homepage.util;

import java.net.*;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import java.io.File;
import java.io.IOException;
import java.awt.Graphics2D;

import java.awt.Image;
import java.io.FileOutputStream;
import javax.swing.*;
import com.sun.image.codec.jpeg.*;
import java.awt.image.PixelGrabber;

public class ImageManager {

    public static final int SAME = -1;
    public static final int RATIO = 0;

    private static ImageManager instance = new ImageManager();

    public static ImageManager getInstance() {
        return instance;
    }

    private ImageManager() {
    }

    public void resize(File src, File dest, int width, int height) throws IOException {
    	BufferedImage srcImg = ImageIO.read(src);

        //원본이미지의 width,height
        int srcWidth = srcImg.getWidth();
        int srcHeight = srcImg.getHeight();

        // Thumbnail 이미지의 width, height를 구한다.
        int destWidth = -1;
        int destHeight = -1;

        if (width == SAME) {
            destWidth = srcWidth;
        } else if(width > 0){
            destWidth = width;
        }

        if (height == SAME) {
            destHeight = srcHeight;
        } else if(width > 0){
            destHeight = height;
        }

        if (width == RATIO && height == RATIO) {
            destWidth = srcWidth;
            destHeight = srcHeight;
        } else if (width == RATIO) {
            double ratio = ((double)destHeight) / ((double)srcHeight);
            destWidth = (int)((double)srcWidth * ratio);
        } else if (height == RATIO) {
            double ratio = ((double)destWidth) / ((double)srcWidth);
            destHeight = (int)((double)srcHeight * ratio);
        }

        //새로 생성할 이미지에 해당하는 BufferedImage 객체를 생성
        BufferedImage destImg = new BufferedImage(destWidth, destHeight, BufferedImage.TYPE_3BYTE_BGR);

        //destImg 에 그림을 그릴 수 있는 Graphics2D 객체 생성
        Graphics2D g = destImg.createGraphics();

        //destImg 에 그림을 그린다.
        g.drawImage(srcImg, 0, 0, destWidth, destHeight, null);

        //새로 생성한 Thumbnail 이미지를 지정한 파일에 저장한다.
        ImageIO.write(destImg, "jpg", dest);
    }


    public void createThumbnailURL(URL src, String target, int targetW, int targetH) throws IOException {
        Image imgSource = new ImageIcon(src).getImage();

        int newW = targetW;
        int newH = targetH;

        Image imgTarget = imgSource.getScaledInstance(newW, newH, Image.SCALE_SMOOTH);
        int pixels[] = new int[newW * newH];

        PixelGrabber pg = new PixelGrabber(imgTarget, 0, 0, newW, newH, pixels, 0, newW);

        try {
        	pg.grabPixels();
        } catch (InterruptedException e) {
            System.out.println("interrupted waiting for pixels!");
            return;
        }

        BufferedImage bi = new BufferedImage(newW, newH, BufferedImage.TYPE_INT_RGB);
        bi.setRGB(0, 0, newW, newH, pixels, 0, newW);
        FileOutputStream fos = new FileOutputStream(target);
        JPEGImageEncoder jpeg = JPEGCodec.createJPEGEncoder(fos);
        JPEGEncodeParam jep = jpeg.getDefaultJPEGEncodeParam(bi);
        jep.setQuality(1, false);
        jpeg.encode(bi, jep);
        fos.close();

    }

    /**
     * 썸네일 생성 -- 썸네일 화질 보정
     **/
    public void createThumbnail(String soruce, String target, int targetW) throws Exception {
    	Image imgSource = new ImageIcon(soruce).getImage();

		// Determine the scale.
		double scale = (double) targetW / (double) imgSource.getHeight(null);
		if (imgSource.getWidth(null) > imgSource.getHeight(null)) {
		    scale = (double) targetW / (double) imgSource.getWidth(null);
		}
		
		int newW = 0;
		int newH = 0 ;
		if (imgSource.getWidth(null) < targetW && imgSource.getHeight(null) < targetW) {
		    newW = (int) (imgSource.getWidth(null));
		    newH = (int) (imgSource.getHeight(null));
        } else {
            newW = (int) (scale * imgSource.getWidth(null));
            newH = (int) (scale * imgSource.getHeight(null));
        }

        Image imgTarget = imgSource.getScaledInstance(newW, newH, Image.SCALE_SMOOTH);
        int pixels[] = new int[newW * newH];

        PixelGrabber pg = new PixelGrabber(imgTarget, 0, 0, newW, newH, pixels, 0, newW);

        try {
            pg.grabPixels();
        } catch (InterruptedException e) {
            System.out.println("interrupted waiting for pixels!");
            return;
        }

        BufferedImage bi = new BufferedImage(newW, newH, BufferedImage.TYPE_INT_RGB);
        bi.setRGB(0, 0, newW, newH, pixels, 0, newW);
        FileOutputStream fos = new FileOutputStream(target);
        JPEGImageEncoder jpeg = JPEGCodec.createJPEGEncoder(fos);
        JPEGEncodeParam jep = jpeg.getDefaultJPEGEncodeParam(bi);
        jep.setQuality(1, false);
        jpeg.encode(bi, jep);
        fos.close();
	}

    /**
     * 이미지의 Width 리턴
     * @param realFile File
     * @return int
     */
    public int getImgWidth (File realFile) {
        int imgWidth = 0;

        try {
          BufferedImage srcImg = ImageIO.read(realFile);
          imgWidth = srcImg.getWidth();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
        }

        return imgWidth;
    }

    /**
     * 이미지의 Height 리턴
     * @param realFile File
     * @return int
     */
    public int getImgHeight (File realFile) {
        int imgWidth = 0;

        try {
          BufferedImage srcImg = ImageIO.read(realFile);
          imgWidth = srcImg.getHeight();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
        }

        return imgWidth;
    }

}
