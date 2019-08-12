package kr.coo.civ.service;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import kr.coo.civ.util.FileUtil;
import kr.coo.civ.vo.dto.ServiceImgDTO;
import lombok.Setter;

public class ServiceService {
	
	String tPath = "/upload";
	public String getDir() {
		String path = "";
		try {
			path = this.getClass().getResource("/").getPath();
			path = path.substring(1, path.lastIndexOf("/WEB-INF/classes/"));
			path = path + tPath;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return path;
	}
	
	/*
	 * ���� ���� ���ε带 ó���� ���� �Լ�
	 */
	public ServiceImgDTO uploadProc(MultipartFile upfile, ServiceImgDTO serviceImgDTO,String downPath) { 
		// ���� uploadProc() �����ε� �� ���´�.
		
		/*
			�� �Լ��� ������ ���ε� �ϱ� ���ؼ��� 
			��Ʈ�ѷ����� ���ε��� ������ ������ �޿;� �Ѵ�.
		 */
		// ���� �̸��� ����� ���� ����
		String saveName = "";
		
		String path = getDir();
		long len = upfile.getSize();
		// ���� �̸��� �˾Ƴ���.
		String oriName = upfile.getOriginalFilename();
		// ���� �� ������ ���ε� ���� �ʾҴٸ� �۾��� �Ұ����ϴ�.
		// ==> �������� ������ ���ÿ� ���ε� �ϴ°�� �߰��� ���ε� ���� ���� ������ ���� �� �� �ִ�.
		if(oriName == null || oriName.length() == 0) {
			saveName = "";
		} else {
			// ���⸦ �����Ѵٴ� �ǹ̴� �ϴ� ���ε��� ������ �ִٴ� �̾߱� �̰�
			// ���� ���� �̸��� ������ �����Ѵٸ� ������ ��ü�� �� ���̱� ������
			// �̸��� �ٲ㼭 �����Ѵ�.
			saveName = FileUtil.rename(downPath, oriName);
			// ���� ����� ���� �̸��� �غ� �����Ƿ� ������ ����� ���´�.
				
			// ������ �ӽ÷� ���ε�� ������ �������� ��ο� �����Ѵ�.
			// �� �̸��� �����ͺ��̽��� ����� �� ����ؾ� �Ѵ�.
			// ���� ����� ���� �ʿ䰡 �ִ�.
			try {
				File file = new File(downPath, saveName);
				upfile.transferTo(file);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			//siVO.setLen(len);
			//siVO.setOriName(oriName);
			//siVO.setSaveName(saveName);
			serviceImgDTO.setSimg_path(saveName);
			serviceImgDTO.setOriName(oriName);
		}
		
		return serviceImgDTO;
	}
	
	/*
	 * ��Ƽ ���� ���ε带 ó���� ���� �Լ�
	 */
	public ServiceImgDTO[] uploadProc(MultipartFile[] upfile,String downPath) {

		ServiceImgDTO[] siDTO = new ServiceImgDTO[upfile.length];
		
		for(int i = 0 ; i < upfile.length ; i++ ) {
			ServiceImgDTO serviceImgDTO = new ServiceImgDTO();
			// �迭�� �ִ� ������ �ϳ��� ������ �۾��Ѵ�.
			siDTO[i] = uploadProc(upfile[i], serviceImgDTO,downPath);
		}
		return siDTO;
	}
	
}
