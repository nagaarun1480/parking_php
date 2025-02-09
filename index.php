<?Php 
session_start();

include("db.php"); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">

</head>
<body>
    
<header class="header">

    <div id="menu-btn" class="fas fa-bars"></div>

    <a href="#" class="logo"> <span>Smart</span>Park</a>

    <nav class="navbar">
        <a href="#home">Home</a>
        <a href="#reviews">reviews</a>
    </nav>

    <div id="login-btn">
        <button class="btn"> User login</button>
        <i class="far fa-user"></i>
    </div>

    <div id="login-btn">
       <a href="admin_login.php"><button class="btn"> Admin login</button></a>
        <i class="far fa-user"></i>
    </div>

</header> 
<?php
// Include database connection file

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get username and password from the form
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Prepare SQL statement to retrieve user data from the database
    $sql4 = "SELECT * FROM users WHERE username = '$username'";
    $result4 = $con->query($sql4);

    if ($result4->num_rows == 1) {
        // If username exists, fetch user data
        $row4 = $result4->fetch_assoc();
        // Verify password
        if (password_verify($password, $row4['password'])) {

            $_SESSION['username'] = $username;

            // Password is correct, redirect to dashboard or another page
            header("Location: dashboard.php");
            exit();
        } else {
            // Password is incorrect, display error message
            $error_message = "Invalid username or password.";
        }
    } else {
        // Username doesn't exist, display error message
        $error_message = "Invalid username or password.";
    }
}
?>

<div class="login-form-container">
    <span id="close-login-form" class="fas fa-times"></span>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <h3>User Login</h3>
        <input type="text" name="username" placeholder="Username" class="box">
        <input type="password" name="password" placeholder="Password" class="box">
        <input type="submit" value="Login" class="btn">
        <?php
        // Display error message if exists
        if (isset($error_message)) {
            echo '<p style="color: red;">' . $error_message . '</p>';
        }
        ?>
        <p>Don't have an account? <a href="register.php">Create one</a></p>
    </form>
</div><br><br>


<section class="home" id="home">

    <h3 data-speed="-2" class="home-parallax">Park your car</h3>

    <img data-speed="5" class="home-parallax" src="image/home-img.png" alt="">


</section>



<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "parking";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch cars from the database
$sql = "SELECT * FROM parking_area";
$result = $conn->query($sql);
?>





<?php




// Fetch cars from the database
$sql1 = "SELECT * FROM reviews";
$result1 = $conn->query($sql1);
?>




<?php
$conn->close();
?>




<section class="reviews" id="reviews">

    <h1 class="heading"> client's <span>review</span> </h1>

    <div class="swiper review-slider">

        <div class="swiper-wrapper">
        <?php
            if ($result1->num_rows > 0) {
                // Output data of each row
                while ($row1= $result1->fetch_assoc()) {
            ?>
            <div class="swiper-slide box">
                <div class="content">
<p><?php echo $row1['review']; ?> </p>
                    <h3><?php echo $row1['username']; ?></h3>
                    <?php
                    $rating = $row1["rating"];
        for ($i = 0; $i < $rating; $i++) {
            echo "<i class='fas fa-star' style='color:gold;font-size:29px;'></i>";
        }?>
                </div>
            </div>
            <?php
                }
            } else {
                echo "No cars available.";
            }
            ?>
           

           

           

           

            

        </div>

        <div class="swiper-pagination"></div>

    </div>

</section>


<section class="footer" id="footer">

<div class="credit"> All Rights Reserved By Smart Park </div>

</section>

<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

<script src="js/script.js"></script>

</body>
</html>