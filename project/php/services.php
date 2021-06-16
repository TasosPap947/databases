<?php
include('header.php');
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<body>

	<form action="" method="post">
		<br><p>Τύπος Υπηρεσίας:</p>
		<label><input type="radio" name="service_type" value="service">όλες</label>
		<label><input type="radio" name="service_type" value="service_without_subscription">χωρίς συνδρομή</label>
		<label><input type="radio" name="service_type" value="service_with_subscription">με συνδρομή</label>

		<br><br><p>Κόστος:</p>
		<label for="min_cost">ελάχιστο</label><br>
		<input type="text" id="min_cost" name="min_cost" value=""><br><br>
		<label for="max_cost">μέγιστο</label><br>
		<input type="text" id="max_cost" name="max_cost" value=""><br><br>
		<br>
		<label><input type="submit" name="submit" value="Καταχώρηση"></label>
	</form>
	<br>
	<?php
	if(isset($_POST['submit'])){
		if(!empty($_POST['service_type'])) {
			$type = $_POST['service_type'];
			$min_cost = $_POST['min_cost'];
			$max_cost = $_POST['max_cost'];
			$query_cost = " where service_description!='Room'";
			if($min_cost) {
				$query_cost = $query_cost." and service_cost >= ".$min_cost;
			}
			if($max_cost){
				$query_cost = $query_cost." and service_cost <= ".$max_cost;
			}
			?>

			<h2> Αποτελέσματα Υπηρεσιών: </h2>
			<table
			class="content-table"
			align="left"
			border="1px"
			style="width:800px;
			line-height:25px;" >
			<thead>
				<caption style="font-weight: bold">Υπηρεσίες</caption>
				<tr>
					<th> Περιγραφή </th>
					<th> Κόστος </th>
				</tr>
			</thead>

			<?php
			$query = "
			select service_description, service_cost
			from ".$type.$query_cost.";";
			$result = mysqli_query($conn, $query);
			while($rows_data = mysqli_fetch_assoc($result))
			{
				?>
				<tr align="center">
					<td><a href="visits.php
						?service_description=<?php echo $rows_data['service_description'] ?>">
						<?php echo $rows_data['service_description'] ?></a></td>
					<td><?php echo $rows_data['service_cost'] ?></td>
					<?php
				}
				?>
			</table>

			<?php
		}
		else {
			echo 'Επέλεξε τύπο υπηρεσίας';
		}
	}
	?>

</body>
</html>
