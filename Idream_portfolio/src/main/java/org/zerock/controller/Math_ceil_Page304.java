package org.zerock.controller;

// 페이지 번호를 표시하고 사용자가 페이지 번호를 클릭할 수 있는 작업은 다음의 단계를 고려해야 합니다.
// 1) 브라우저 주소창에서 페이지 번호를 전달해서 결과를 확인하는 단계
// 2) JSP에서 페이지 번호를 출력하는 단계
// 3) 각 페이지 번호에 클릭 이벤트 처리 단계
// 4) 전체 데이터 개수를 반영해서 페이지 번호를 조절하는 단계

// 페이징 처리할 때 필요한 정보들
// 1) 현재 페이지 번호 = page
// 2) 이전(prev), 다음(next)으로 이동 가능한 링크의 표시 여부
// 3) 화면에서 보여지는 페이지의 시작 번호(startPage)와 끝 번호(endPage)

// 끝페이지 번호와 시작 페이지 번호 고려 사항
// 페이징  처리를 하기 위해서 우선적으로 필요한 정보는 현재 사용자가 보고 있는 페이지(page)의
// 정보입니다. 예를 들면, 화면에 10개씩 페이지 번호를 출력한다고 가정할 경우,
// 사용자가 5페이지를 본다면 화면의 페이지 번호는 1부터 시작하지만,
// 사용자가 19페이지를 본다면 11부터 시작해야 합니다.
// 이때, 끝번호를 먼저 계산하는 것이 시작 번호를 계산하는것보다 수월합니다.
// 다음은 페이지 번호가 10개씩 보인다고 가정할 경우, 페이징의 끝 번호(endPage) 계산 구문입니다.
// this.endPage = (int)(Math.ceil(페이지번호/10.0)) * 10;
// Math.ceil()은 소수점을 올림으로 처리하는 역할을 합니다.

// 만약 화면에 10개씩 데이터를 보여준다면 시작 번호(startPage)는 끝 번호(endPage)에서
// 9라는 값을 뺀 값이 됩니다. 다음은 페이징의 시작 번호(startPage) 계산 구문입니다.
// this.startPage = this.endPage - 9;

// 끝 번호(endPage)는 전체 데이터 수(total)에 의한 영향도 받습니다.
// 예를 들면, 10개씩 보여주는 경우 전체 데이터 수(total)가 80개라면
// 끝 번호(endPage)는 10이 아닌 8이 되어야만 합니다.
// 만약 끝 번호(endPage)와 한 페이당 출력되는 데이터 수(amount)의 곱이 전체 데이터 수(total)
// 보다 크다면 끝 번호(endPage)는 다시 total을 이용해서 다시 계산되어야 합니다.
// 다음은 total을 통한 endPage의 재계산 구문입니다.
// realEnd = (int) (Math.ceil((total*1.0)/amount));
// if(realEnd < this.endPage){
//    this.endPage = realEnd;
// }

public class Math_ceil_Page304 {

	public static void main(String[] args) {
		System.out.println(Math.ceil(0.1)*10); // 10.0
		System.out.println(Math.ceil(1)*10);   // 10.0
		System.out.println(Math.ceil(1.1)*10); // 20.0
	}
	
}
