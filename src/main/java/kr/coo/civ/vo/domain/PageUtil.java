package kr.coo.civ.vo.domain;

/**
 *  이 클래스는 페이지 이동 기능에 필요한 정보를 계산하기 위해서
 *  만드는 유틸리티 클래스이다.
 * 
 * @author	전은석
 * @since	2019년 06월 05일
 * @version	1.0
 * @see
 * 			유지관리 이력
 * 			2019/06/05 		PageUtil 클래스 제작		작성자 : 전은석
 *
 */
public class PageUtil {
	// 변수 선언
	// 알려줘야 할 요소
	private int nowPage;		// 현재 보고 있는 페이지
	private int totalCount;		// 총 게시물 갯수
	
	// 개발자가 선택할 수 있는 요소
	private int pageRow;		// 한 페이지당 나올 게시물 갯수
	private int pageGroup;		// 한 화면당 페이지 이동 기능 갯수
	
	// 계산해서 산출될 요소
	private int startPage;		// 해당화면에서 나타날 페이지 이동 시작 페이지
	private int endPage;		// 해당화면에서 나타날 페이지 이동 마지막 페이지
	
	private int nowGroup;
	private int startContent;	// 열린 페이지의 시작 게시물 행번호
	private int endContent;		// 열린 페이지의 마지막 게시물 행번호
	
	// 반드시 필요한 요소는 아지만 중간 계산에 필요한 요소
	// 가끔은 화면에 출력에도 필요한 요소
	private int totalPage;	// 총 페이지 수
	private String word;
	
	// 이제 정보를 받아보자
	// 정보는 필수로 2가지를 알아야 한다.
	// 이 정보는 이 클래스를 new 시킬때(객체를 만들때) 셋팅하자.
	
	public PageUtil(int nowPage, int totalCount) {
		this(nowPage, totalCount, 5, 5);
	}
	
	public PageUtil(int nowPage, int totalCount, int pageRow, int pageGroup) {
		this.nowPage = nowPage;
		this.totalCount = totalCount;
		this.pageRow = pageRow;
		this.pageGroup = pageGroup;
		
		// 계산한다.
		calcPage();
		calcStart();
		calcEnd();
		calcNowGroup();
		calcContent();
	}

	
	// 총 페이지수를 계산할 함수
	public void calcPage() {
		/*
			총 페이지 수는 총 데이터 갯수(totalCount)를
			한 화면에 표시할 게시물 갯수(pageRow)로 나누면 된다.
			
			단, 경우에 따라서는 한 페이지가 증가 될 수 있다.
		 */
		totalPage = (totalCount % pageRow == 0) ? (totalCount / pageRow) : (totalCount / pageRow + 1);
	}
	
	// 시작 페이지 수를 계산할 함수
	public void calcStart() {
		/*
			페이지 이동 기능에 나타날 페이지는 개발자가 어떻게 만드는가에 따라서 달라진다.
			
			고전방식]
					현재 페이지와 관계없이
					1-10, 11-20, 21-30까지 고정시켜서 보여주는 방식
				예]
					[이전][1][2][3][4][5][다음]
					
				계산원리]
					1) 보고 있는 페이지가 몇번째 그룹인지를 계산한다.
						[1][2][3][4][5]				==> 0
						1	6
						2	7
						3	8
						4	9
						5	10
						[6][7][8][9][10]			==> 1
						[11][12][13][14][15]		==> 2
		 */
		int tmpGroup = (nowPage - 1) / pageGroup;
		/*
		 	시작 페이지 계산
		 		예]
		 			0 그룹	1
		 			1 그룹	6
		 			2 그룹	11
		 */
		startPage = tmpGroup * pageGroup + 1;

		/*
			요사이 트랜드
				현재 페이지를 가운데 놓는 방식을 사용한다.
				현재페이지가 3 페이지이면
					[1][2][3][4][5]
					
				현재 페이지가 5 페이지이면
					[3][4][5][6][7]
					
			힌트]
				현재 보고있는 페이지에서 보여줄 페이지 개수의 절반만큼 빼면 된다.
				문제]
					[1] 인 경우에는 
					(즉, 절을 뺀 결과가 0이하가 되는 경우)
					그 앞쪽에 이동 가능한 페이지가 없다.
					이때는 강제로 1페이지로 지정해야 한다.
			
		 */
	}
	
	// 종료 페이지 수를 계산할 함수
	public void calcEnd() {
		int tmpGroup = (nowPage - 1) / pageGroup;
//		endPage = startPage + (pageGroup - 1);
		endPage = (tmpGroup + 1) * pageGroup;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
	}
	
	// 현재페이지그룹 계산함수
	public void calcNowGroup() {
		this.nowGroup = (nowPage - 1) / pageGroup;
	}
	
	// 현재페이지 시작 & 끝 게시물 번호 계산 함수
	public void calcContent() {
		// 시작 게시물 계산
		this.startContent = (nowPage - 1)*pageRow + 1;
		// 종료 게시물 계산
		this.endContent = nowPage * pageRow;
		
	
	}
	
	
	// get(), set() 만들어주자.
	
	public int getNowPage() {
		return nowPage;
	}
	
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	public int getPageRow() {
		return pageRow;
	}
	
	public void setPageRow(int pageRow) {
		this.pageRow = pageRow;
	}
	
	public int getPageGroup() {
		return pageGroup;
	}
	
	public void setPageGroup(int pageGroup) {
		this.pageGroup = pageGroup;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public int getNowGroup() {
		return nowGroup;
	}

	public void setNowGroup(int nowGroup) {
		this.nowGroup = nowGroup;
	}

	public int getStartContent() {
		return startContent;
	}

	public void setStartContent(int startContent) {
		this.startContent = startContent;
	}

	public int getEndContent() {
		return endContent;
	}

	public void setEndContent(int endContent) {
		this.endContent = endContent;
	}

	public int getTotalPage() {
		return totalPage;
	}
	
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}
	
}
