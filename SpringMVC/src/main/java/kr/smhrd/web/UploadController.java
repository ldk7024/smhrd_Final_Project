package kr.smhrd.web;


import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;


import javax.print.attribute.standard.Media;
import javax.servlet.http.HttpServletRequest;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.smhrd.domain.AttachFileVO;

@Controller
public class UploadController {

	@GetMapping("/uploadForm.do")
	public void uploadForm() { // void로 주면 디폴트는 자동으로 매핑주소
		// uploadForm.jsp
		// return "uploadForm";
	}
	@PostMapping("/uploadFormAction.do")
	public void uploadFormAction(MultipartFile[] uploadFile, Model model) {
		
		List<AttachFileVO> list = new ArrayList<AttachFileVO>();
		
		String uploadFolder="C:\\upload";
		String uploadFolderPath = getFolder(); // 2021/07/27
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs(); // 디렉토리생성
		}
		// 생성후 반복문을 통해 하나씩 가져옴 
		for (MultipartFile multipartFile : uploadFile) {
			System.out.print(multipartFile.getOriginalFilename()+":");
			System.out.println(multipartFile.getSize());
			
			AttachFileVO vo = new AttachFileVO();  //MultipartFile 쓰기 좋게 어태치파일에 담아줌
			
			
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);// O
			UUID uuid = UUID.randomUUID();//랜덤수를 만들어주는 클래스(중복방지)
			uploadFileName=uuid.toString()+"_"+uploadFileName;
			
			File saveFile = new File(uploadPath, uploadFileName);
			try {
				multipartFile.transferTo(saveFile);	
				vo.setUuid(uuid.toString()); // O
				vo.setUploadPath(uploadFolderPath);// O
				list.add(vo);// O
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("list", list); //객체바인딩 request.setAttribute O
	}
	// 메소드
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str=sdf.format(date); // 날짜 변환 (2021-07-08)
		return str.replace("-", "/"); // 디렉토리도 하나의 파일로 봄 separator  - => \ 변환
	}
	//                                                      MIME TYPE(서버가 클라이언트에 보내는 데이터 종류)
	//                               binary               'application/octet-stream'
	@GetMapping(value="/download.do", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody  // (ResponseBody : json형식일때 사용 여기선 생략 가능 )download.jsp <- (X)   리턴타입 앞에다 붙혀도 됨
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName) {
		//리턴타입을 String이나 void를 하면 포워딩이 일어나서 화면이 안나옴!
		//System.out.println(fileName);	
		//Resource : 파일
		Resource resource = new FileSystemResource("C:\\upload\\"+fileName);   //리소스 안의 실제 파일의 경로가 완성!   //리소스 안의 실제 파일의 경로가 완성!
		String resourceName=resource.getFilename();
		System.out.println(resourceName);
		
		String resourceOriginalName=resourceName.substring(resourceName.indexOf("_")+1);
		// 다운로드 작업   Headers : 다운받을때 클라이언트에 미리 데이터를 보내기전에 준비해라잇! 
		HttpHeaders headers = new HttpHeaders();
		try { //                                    첨부
			String downloadName=null;
			
			if(userAgent.contains("Trident")) {
				System.out.println("IE");
				downloadName=URLEncoder.encode(resourceOriginalName,"UTF-8").replaceAll("\\+"," ");//인코딩
			}else if(userAgent.contains("Edge")) {
				System.out.println("Edge");
				downloadName=URLEncoder.encode(resourceOriginalName,"UTF-8");//인코딩
			}else {
				System.out.println("Chrome");
				downloadName=new String(resourceOriginalName.getBytes("UTF-8"),"ISO-8859-1");//인코딩
			}
			headers.add("Content-Disposition", "attachement;filename="+downloadName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK); // ok = 200
	}
}
