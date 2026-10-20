<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    
    <div class="menu-list-container">
    	<div class="menu-list-header">
    		<p>NEW</p>
    		<p>COFFE</p>
    		<p>COLD BREW</p>
    		<p>BEVERAGE</p>
    		<p>FRAPPE</p>
    		<p>ADE & MOJITO</p>
    		<p>TEA & JUICE</p>
    		<p>DESSERT</p>    	
    	</div>
		<div class="menu-list" id="menu-list">
			
		</div>    
    </div>
    
    
    
    <script type="text/javascript">
    	let menuHtml = "";
		let menuId = document.getElementById("menu-list");     
    	const menuList = [
	    {
	        id: 1,
	        name: "라이트 바닐라크림콜드브루",
	        desc: "가볍게 즐기는 바닐라 크림 콜드브루",
	        status: "SALE",
	        imageUrl: "https://via.placeholder.com/150x220/E8D5C4/333333?text=Light+Vanilla"
	    },
	    {
	        id: 2,
	        name: "콜드브루 커피",
	        desc: "저온에서 오래 우려낸 깔끔한 맛의 커피",
	        status: "SALE",
	        imageUrl: "https://via.placeholder.com/150x220/3E2723/FFFFFF?text=Cold+Brew"
	    },
	    {
	        id: 3,
	        name: "콜드브루 라떼",
	        desc: "콜드브루에 우유를 더한 부드러운 라떼",
	        status: "SALE",
	        imageUrl: "https://via.placeholder.com/150x220/D7CCC8/333333?text=Cold+Brew+Latte"
	    },
	    {
	        id: 4,
	        name: "말차 콜드브루 라떼",
	        desc: "진한 말차와 콜드브루의 색다른 조화",
	        status: "SALE",
	        imageUrl: "https://via.placeholder.com/150x220/C8E6C9/333333?text=Matcha+Latte"
	    },
	    {
	        id: 5,
	        name: "바닐라크림 콜드브루 라떼",
	        desc: "바닐라 크림을 올린 달콤한 콜드브루 라떼",
	        status: "SALE",
	        imageUrl: "https://via.placeholder.com/150x220/FFE0B2/333333?text=Vanilla+Cream"
	    },
	    {
	        id: 6,
	        name: "디카페인 콜드브루 커피",
	        desc: "카페인 부담을 줄인 깔끔한 콜드브루",
	        status: "SALE",
	        imageUrl: "https://via.placeholder.com/150x220/212121/FFFFFF?text=Decaf+Coffee"
	    },
	    {
	        id: 7,
	        name: "율무크림콜드브루",
	        desc: "고소한 율무 크림을 올린 콜드브루",
	        status: "SEASON_OUT",
	        imageUrl: "https://via.placeholder.com/150x220/BCAAA4/333333?text=Yulmu+Cream"
	    },
	    {
	        id: 8,
	        name: "오렌지크리미슈페너",
	        desc: "상큼한 오렌지와 크림을 함께 즐기는 슈페너",
	        status: "SALE",
	        imageUrl: "https://via.placeholder.com/150x220/FFCC80/333333?text=Orange+Einspanner"
	    },
	    {
	        id: 9,
	        name: "연유크리미슈페너",
	        desc: "달콤한 연유 크림을 올린 슈페너",
	        status: "SALE",
	        imageUrl: "https://via.placeholder.com/150x220/F5F5DC/333333?text=Condensed+Milk"
	    },
	    {
	        id: 10,
	        name: "유자 크러셔 콜드브루",
	        desc: "유자 과육과 콜드브루를 함께 즐기는 음료",
	        status: "SEASON_OUT",
	        imageUrl: "https://via.placeholder.com/150x220/FFF59D/333333?text=Yuja+Crusher"
	    }
		];
    	
    	menuHtml = ``;	
    	menuList.forEach((item, index) => {
    		menuHtml += `<div class="menu">
				<div class="menu-image">`;
			menuHtml += `<img src=`
			menuHtml += item.imageUrl
			menuHtml += `>`
			menuHtml += `<div class="menu-title">`
			menuHtml += item.name
			menuHtml += `<div class="menu-description">`
			menuHtml += item.desc
			menuHtml += `</div>`
			menuHtml += `</div>`
			menuHtml += `</div>
				</div>`;	
    	})
    	
    	menuId.innerHTML = menuHtml;
    </script>