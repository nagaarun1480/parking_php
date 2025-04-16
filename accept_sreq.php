<?php
session_start();
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

// Check if the ID parameter is set
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $username = $_GET['username'];
    $total_price = $_GET['total_price'];

    // Update the status to 1 for the given booking ID
    $sql = "UPDATE bookings SET status = 1 WHERE id = $id";

    $sql1 = "SELECT wallet FROM users WHERE username = ?";
$stmt = $conn->prepare($sql1);
$stmt->bind_param("s", $username);
$stmt->execute();
$result = $stmt->get_result();

$total_wallet = 0;
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $total_wallet = $row["wallet"];
}

$stmt->close();
    
$sql2 = "UPDATE users SET wallet = wallet - ? WHERE username = ?";
$stmt = $conn->prepare($sql2);
$stmt->bind_param("ds", $total_price, $username); // d = double (float), s = string
$stmt->execute();
$stmt->close();    
    if ($conn->query($sql) === TRUE) {
        // Redirect back to the view requests page
        echo '<script type="text/javascript">
        window.alert("Request Accepted Successfully");
        window.location="view_request.php";
        </script>';
                exit();
    } else {
        echo "Error updating record: " . $conn->error;
    }
} else {
    echo "ID parameter not set";
}

$conn->close();
?>
