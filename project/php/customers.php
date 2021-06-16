<?php
include('header.php');
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<body>
	<h2> Customer Table </h2>
	<table
	class="content-table"
	align="left"
	border="1px"
	style="width:800px;
	line-height:25px;" >
	<thead>
		<caption style="font-weight: bold">Customer Record</caption>
		<tr>
			<th> First Name </th>
			<th> Last Name </th>
			<th> Phone Number </th>
			<!-- <th> Email </th> -->
			<th> NFC ID </th>
			<th> Date of Birth </th>
			<th> Document Number </th>
			<th> Document Type </th>
			<th> Document Authority </th>

		</tr>
	</thead>

	<?php
	$query = "
	SELECT c.nfc_id, c.first_name, c.last_name, cp.phone_number,
	c.date_of_birth, c.document_number, c.document_type, c.document_authority
	FROM customer as c LEFT JOIN customer_phone as cp
	ON cp.customer_id = c.nfc_id
	ORDER BY c.first_name;";
	$result = mysqli_query($conn, $query);
	?>

	<?php


	while($rows_data = mysqli_fetch_assoc($result))
	{
		?>
		<tr align="center">
			<td><?php echo $rows_data['first_name'] ?></td>
			<td><?php echo $rows_data['last_name'] ?></td>
			<td><?php echo $rows_data['phone_number'] ?></td>
			<!-- <td><?php echo $rows_data['email'] ?></td> -->
			<td><?php echo $rows_data['nfc_id'] ?></td>
			<td><?php echo $rows_data['date_of_birth'] ?></td>
			<td><?php echo $rows_data['document_number'] ?></td>
			<td><?php echo $rows_data['document_type'] ?></td>
			<td><?php echo $rows_data['document_authority'] ?></td>

			<?php
		}
		?>
	</table>
</body>

</html>

<?php
$conn->close();
?>
