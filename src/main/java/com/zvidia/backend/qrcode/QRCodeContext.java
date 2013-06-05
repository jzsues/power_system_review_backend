/**
 * 
 */
package com.zvidia.backend.qrcode;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

import javax.imageio.ImageIO;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Component;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.LuminanceSource;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.zvidia.backend.exception.QRCodeException;
import com.zvidia.common.security.SecurityUtils;

/**
 * @author jiangzm
 * 
 */
@Component
@ImportResource("classpath:zvidia-properties-config.xml")
public class QRCodeContext {
	Log log = LogFactory.getLog(getClass());
	public static final String QRCODE_INFO_ID_KEY = "id";
	public static final String QRCODE_INFO_NAME_KEY = "name";

	private static final BarcodeFormat DEFAULT_BARCODE_FORMAT = BarcodeFormat.QR_CODE;
	private static final String DEFAULT_IMAGE_FORMAT = "PNG";
	private static final int DEFAULT_WIDTH = 600;
	private static final int DEFAULT_HEIGHT = 600;

	@Value("${qrcode.folder.path}")
	private String qrcodeFolder;

	@Value("${qrcode.context.path}")
	private String fileHttpContextPath;

	@Value("${qrcode.separator}")
	private String separator;

	public String getQrcodeFolder() {
		return qrcodeFolder;
	}

	public String getFileHttpContextPath() {
		return fileHttpContextPath;
	}

	public String getSeparator() {
		return separator;
	}

	public String writeToFile(String content) throws QRCodeException {
		return writeToFile(content, null, null);
	}

	/**
	 * 将指定字符串内容生成QR CODE，并写到文件，返回带格式后缀的文件名
	 * 
	 * @param content
	 * @param width
	 * @param height
	 * @return
	 * @throws QRCodeException
	 */
	public String writeToFile(String content, Integer width, Integer height) throws QRCodeException {
		try {
			if (width == null || width < 1) {
				width = DEFAULT_WIDTH;
			}
			if (height == null || height < 1) {
				height = DEFAULT_HEIGHT;
			}
			String md5 = SecurityUtils.md5(content);
			String name = md5 + ".png";
			String pathname = qrcodeFolder + File.separator + name;
			File file = new File(pathname);
			MultiFormatWriter barcodeWriter = new MultiFormatWriter();
			BitMatrix matrix = barcodeWriter.encode(content, DEFAULT_BARCODE_FORMAT, width, width);
			MatrixToImageWriter.writeToFile(matrix, DEFAULT_IMAGE_FORMAT, file);
			return name;
		} catch (Exception e) {
			throw new QRCodeException(e);
		}
	}

	/**
	 * 从指定带后缀文件名读取QR CODE编码前的字符串信息
	 * 
	 * @param fileName
	 * @return
	 * @throws QRCodeException
	 */
	public String readFromFile(String fileName) throws QRCodeException {

		try {
			Result result = null;
			BufferedImage image = null;
			String pathname = qrcodeFolder + File.separator + fileName;
			image = ImageIO.read(new File(pathname));
			LuminanceSource source = new BufferedImageLuminanceSource(image);
			BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));
			Map<DecodeHintType, Object> hints = new Hashtable<DecodeHintType, Object>();
			hints.put(DecodeHintType.CHARACTER_SET, "UTF-8");
			result = new MultiFormatReader().decode(bitmap, hints);
			String rtn = result.getText();
			return rtn;
		} catch (Exception e) {
			throw new QRCodeException(e);
		}
	}

	public String buildQRCodeString(String id, String name) throws QRCodeException {
		if (id == null || StringUtils.isEmpty(name)) {
			throw new QRCodeException("基站信息异常");
		}
		return id + separator + name;
	}

	public Map<String, String> parseQRCode(String qrcode) throws QRCodeException {
		Map<String, String> res = new HashMap<String, String>();
		if (qrcode == null) {
			throw new QRCodeException("qr code不能为空");
		}
		String[] splits = qrcode.split(separator);
		if (splits.length != 2) {
			throw new QRCodeException("qr code格式错误");
		}
		res.put(QRCODE_INFO_ID_KEY, splits[0]);
		res.put(QRCODE_INFO_NAME_KEY, splits[1]);
		return res;
	}
}
