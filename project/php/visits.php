<?php
include('header.php');
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<body>

	<p><a href="services.php">Πίσω στις υπηρεσίες</a></p>

	<?php
	$service_description = $_GET['service_description'];
	$query="
	select place_name from
	(
		service join offered_in on offered_in.service_id=service.service_id)
		join place on place.place_id=offered_in.place_id
		where service.service_description='";
		$query = $query.$service_description."';";
		$result = mysqli_query($conn, $query);
		$place_name = mysqli_fetch_assoc($result);
		$place_name = $place_name['place_name'];
		?>

		<h3> Χρήσεις Υπηρεσίας "<?php echo $service_description; ?>"</h3>

		<form action="" method="post">

			<p>Ημερομηνίες Ενδιαφέροντος:</p>
			<label for="min_date">Από</label><br>
			<input type="date" id="min_date" name="min_date" value=""><br>
			<label for="max_date">Έως</label><br>
			<input type="date" id="max_date" name="max_date" value=""><br><br>
			<br>
			<label><input type="submit" name="submit" value="Καταχώρηση"></label>
		</form>
		<br>

		<?php
		if($place_name != ''){
			$query_date = " where place_name = '".$place_name."'";
		}
		if(isset($_POST['submit'])){
			$min_date = $_POST['min_date'];
			$max_date = $_POST['max_date'];
			if ($min_date) {
				$query_date = $query_date." and entry_date_time <= ".$min_date;
			}
			if ($max_date) {
				$query_date = $query_date." and entry_date_time >= ".$max_date;
			}
		}
		?>

		<h3> Αποτελέσματα : </h3>
		<p>Από:<?php echo $min_date; ?> <br> Έως: <?php echo $max_date; ?></p>
		<table
		class="content-table"
		align="left"
		border="1px"
		style="width:800px;
		line-height:25px;" >
		<thead>
			<caption style="font-weight: bold">Χρήσεις</caption>
			<tr>
				<th> NFC ID </th>
				<th> Όνομα </th>
				<th> Επίθετο </th>
				<th> Ημερομηνία και ώρα χρήσης </th>
			</tr>
		</thead>

		<?php
		$query = "
		select customer.nfc_id,
		customer.first_name,
		customer.last_name,
		visited.entry_date_time
		from
		(
			customer join visited
			on customer.nfc_id = visited.customer_id
			) join place
			on visited.place_id = place.place_id";
			$query = $query.$query_date.";";
			$result = mysqli_query($conn, $query);
			while($rows_data = mysqli_fetch_assoc($result))
			{
				?>
				<tr align="center">
					<td><?php echo $rows_data['nfc_id'] ?></td>
					<td><?php echo $rows_data['first_name'] ?></td>
					<td><?php echo $rows_data['last_name'] ?></td>
					<td><?php echo $rows_data['entry_date_time'] ?></td>
					<?php
				}
				?>
			</body>
			</html>
