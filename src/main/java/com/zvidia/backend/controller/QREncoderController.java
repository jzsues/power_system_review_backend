/**
 * 
 */
package com.zvidia.backend.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Hashtable;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.LuminanceSource;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.zvidia.backend.entity.StationInfo;
import com.zvidia.backend.repository.StationRepository;
import com.zvidia.backend.service.QRCodeService;
import com.zvidia.common.entity.AjaxResponse;
import com.zvidia.common.exception.QRCodeException;
import com.zvidia.common.security.SecurityUtils;

/**
 * @author jiangzm
 * 
 */
@Controller
@RequestMapping("/qr")
@ImportResource("classpath:zvidia-properties-config.xml")
public class QREncoderController {
	Log log = LogFactory.getLog(getClass());
	private static final BarcodeFormat DEFAULT_BARCODE_FORMAT = BarcodeFormat.QR_CODE;
	private static final String DEFAULT_IMAGE_FORMAT = "PNG";
	private static final int DEFAULT_WIDTH = 600;
	private static final int DEFAULT_HEIGHT = 600;

	@Value("${qrcode.folder.path}")
	private String qrcodeFolder;

	@Autowired
	StationRepository stationRepository;

	@Autowired
	QRCodeService qrCodeService;

	@RequestMapping(value = "/encode/{content}", method = RequestMethod.GET)
	public @ResponseBody
	AjaxResponse encode(@PathVariable String content, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException, WriterException {

		// 将图像输出到文件中。
		String md5 = SecurityUtils.md5(content);
		String name = md5 + ".png";
		String pathname = qrcodeFolder + File.separator + name;
		File file = new File(pathname);
		MultiFormatWriter barcodeWriter = new MultiFormatWriter();
		BitMatrix matrix = barcodeWriter.encode(content, DEFAULT_BARCODE_FORMAT, DEFAULT_WIDTH, DEFAULT_HEIGHT);
		MatrixToImageWriter.writeToFile(matrix, DEFAULT_IMAGE_FORMAT, file);
		return new AjaxResponse("http://localhost:8080/file/qrcode/" + name);

	}

	@RequestMapping(value = "/decode/{file}", method = RequestMethod.GET)
	public @ResponseBody
	AjaxResponse decode(@PathVariable String file, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException, NotFoundException {
		Result result = null;
		BufferedImage image = null;
		String pathname = qrcodeFolder + File.separator + file + ".png";
		image = ImageIO.read(new File(pathname));
		LuminanceSource source = new BufferedImageLuminanceSource(image);
		BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));
		Map<DecodeHintType, Object> hints = new Hashtable<DecodeHintType, Object>();
		hints.put(DecodeHintType.CHARACTER_SET, "UTF-8");
		result = new MultiFormatReader().decode(bitmap, hints);
		String rtn = result.getText();
		return new AjaxResponse(rtn);
	}

	@RequestMapping(value = "/from_station/{id}", method = RequestMethod.GET)
	public @ResponseBody
	AjaxResponse fromStation(@PathVariable Long id, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException, NotFoundException, QRCodeException {
		StationInfo station = stationRepository.findOne(id);
		station = qrCodeService.populateQRCodeWithStation(station);
		stationRepository.save(station);
		return new AjaxResponse(station);
	}

	@RequestMapping(value = "/from_qrcode/{qrcode}", method = RequestMethod.GET)
	public @ResponseBody
	AjaxResponse fromQRCode(@PathVariable String qrcode, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException, NotFoundException, QRCodeException {
		StationInfo station = qrCodeService.parseStationFromQRCode(qrcode);
		return new AjaxResponse(station);
	}
}
