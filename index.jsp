<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <title>김수형 자유 프로젝트</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Links to required pages -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="./css/main.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css">

</head>
<body>
<!--------------------------------- navbar ----------------------------------------------->
    <nav class="navbar navbar-expand-md">
        <a class="navbar-brand" href="#" style="color: #FF5733; font-weight: bold;">자동차</a>
        <button class="navbar-toggler navbar-dark" type="button" data-toggle="collapse" data-target="#main-navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="main-navigation">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#" style="color: #fff;">홈</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="advanced-search.php">검색</a>
                </li>
                <?php
                    if (isset($_SESSION['user']) && $_SESSION['user']['admin'] === true) {
                        echo '<li class="nav-item">';
                        echo '<a class="nav-link" href="admin/admin-dashboard.php">Dashboard</a>';
                        echo '</li>';
                    }
                 ?>
                <li class="nav-item">
                    <a class="nav-link" href="#contactMe">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#contactMe">Contact</a>
                </li>
                <li class="nav-item">
                    <?php
                        if (isset($_SESSION['user'])) {
                            echo "<a class='nav-link logOut' href='ex/logout_ex.php'>Logout</a>";
                        }
                        else{
                            echo "<a class='nav-link logIn' href='login.php'>Login</a>";
                        }
                     ?>
                </li>
            </ul>
        </div>
    </nav>
    <!--------------------------------------------------- header -------------------------------------------->
    <header class="page-header header container-fluid">
        <div class="overlay"></div>
        <div class="search-container">
            <div class="search-box">
                <form method="post" action="ex/index_ex.php">
                    <div class="search-form-header">
                        <h2>내 차량 선택하기</h2>
                    </div>
                    <div class="search-form-box">
                        <div class="search-form-box-item search-form-box-item-inner-new">
                            <div class="search-form-box-item-inner">
                                <select name="brand" onchange="filter(this.value)">
                                    <option value="" disabled selected hidden>브랜드</option>
                                    <option value="any_brand">전체</option>
                                    <?php
                                        $brand_result = brand_options();
                                        foreach ($brand_result as $option1) {
                                            echo "<option value='$option1' style = 'text-transform:capitalize'>$option1</option>";
                                        }
                                    ?>
                                </select>
                            </div>
                        </div>

                        <div class="search-form-box-item">
                            <div class="search-form-box-item-inner">
                                <select name="model" id="model1">
                                    <option value="" disabled selected hidden id="demo">모델</option>
                                </select>
                            </div>
                        </div>

                        <div class="search-form-box-item">
                            <div class="search-form-box-item-inner">
                                <select name="fuel_type">
                                    <option value="" disabled selected hidden>연료 종류</option>
                                    <option value="any_fuel">LPG</option>
                                    <option value="petrol">휘발류</option>
                                    <option value="diesel">디젤</option>
                                    <option value="hybrid">하이브리드</option>
                                </select>

                            </div>
                        </div>
                        <div class="search-form-box-item search-form-box-item-inner-new">
                            <div class="search-form-box-item-inner">
                                <select name="min_price">
                                    <option value="" disabled selected hidden>최저 가격</option>
                                    <option value="no_min">최소</option>
                                    <option value="3000">3000달러</option>
                                    <option value="5000">5000달러</option>
                                    <option value="7500">7500달러</option>
                                    <option value="10000">10000달러</option>
                                    <option value="15000">15000달러</option>
                                    <option value="20000">20000달러</option>
                                    <option value="25000">25000달러</option>
                                    <option value="30000">30000달러</option>
                                    <option value="35000">35000달러</option>
                                    <option value="40000">40000달러</option>
                                    <option value="45000">45000달러</option>
                                    <option value="50000">50000달러</option>
                                    <option value="60000">60000달러</option>
                                    <option value="70000">70000달러</option>
                                    <option value="80000">80000달러</option>
                                    <option value="90000">90000달러</option>
                                    <option value="100000">100000달러</option>
                                </select>
                            </div>
                        </div>
                        <div class="search-form-box-item">
                            <div class="search-form-box-item-inner">
                                <select name="max_price">
                                    <option value="" disabled selected hidden>최대 가격</option>
                                    <option value="no_max">최대</option>
                                    <option value="3000">3000달러</option>
                                    <option value="5000">5000달러</option>
                                    <option value="7500">7500달러</option>
                                    <option value="10000">10000달러</option>
                                    <option value="15000">15000달러</option>
                                    <option value="20000">20000달러</option>
                                    <option value="25000">25000달러</option>
                                    <option value="30000">30000달러</option>
                                    <option value="35000">35000달러</option>
                                    <option value="40000">40000달러</option>
                                    <option value="45000">45000달러</option>
                                    <option value="50000">50000달러</option>
                                    <option value="60000">60000달러</option>
                                    <option value="70000">70000달러</option>
                                    <option value="80000">80000달러</option>
                                    <option value="90000">90000달러</option>
                                    <option value="100000">100000달러</option>
                                </select>
                            </div>
                        </div>
                        <div class="search-form-box-item">
                            <div class="search-form-box-item-inner">
                                <select name="transmission">
                                    <option value="" disabled selected hidden id="demo">변속기</option>
                                    <option value="any_transmission">전체</option>
                                    <option value="automatic">자동</option>
                                    <option value="manual">수동</option>
                                </select>
                            </div>
                        </div>
                        <div class="search-form-box-footer">
                            <a href="advanced-search.php">Advanced Search+</a>
                        </div>
                    </div>
                    <div class="search-form-submit">
                        <button type="submit" class="submit-button" id="searchBtn">
                            <span>Search!</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </header>



    <!-- -----------------------------------------SELL SECTION----------------------------------------------- -->
    <div class="ad-container">
        <div class="overlay2"></div>
        <div class="search-container">
            <h2 class="ad-h">내차 팔기!</h2>
            <div class="search-box2">
                <form method="post" action="ad_insert.php">
                    <div>
                        <div class="ad-submit">
                            <button type="submit" class="submit-button" id="sellBtn">
                                <span>내차 팔기</span>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

<!--             <div class="search-box2">
                <form method="post" action="ad_insert.php">
                    <div class="ad-box">
                        <div class="ad-submit">
                            <button type="submit" class="submit-button" id="sellBtn">
                                <span>Sell my car</span>
                            </button>
                        </div>
                    </div>
                </form>
            </div> -->
    </div>
<!------------------------------------------------ Footer ----------------------------------------------------------->
    <footer class="page-footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <h6 class="text-uppercase font-weight-bold">Project Information</h6>
                    <p>김수형 자유 프로젝트.</p>

                </div>

                <div class="col-lg-4 col-md-4 col-sm-12" id="contactMe">
                    <h6 class="text-uppercase font-weight-bold">Contact</h6>
                    <p>용인대학교
                    <br/>202033007@yiu.ac.kr
                    <br/>010-0000-0000
                    <br/>010-0000-0000
                    </p>
                </div>

                <div class="col-lg-2 col-md-2 col-sm-12 footer-icons">
                    <h6 class="text-uppercase font-weight-bold">Follow us</h6>
                    <ul>
                        <li>
                          <a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li>
                          <a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                    </ul>
                    <ul>
                        <li>
                          <a href="#"><i class="fa fa-instagram"></i></a>
                        </li>
                        <li>
                          <a href="#"><i class="fa fa-whatsapp"></i></a>
                        </li>
                    </ul>

                </div>
            </div>
            
    </footer>
<!--------------------------- including javascript pages --------------------------->
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/main.js"></script>

</body>
</html>