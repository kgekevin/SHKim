<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<?php if (isset($_SESSION['event']) && $_SESSION['event']['error'] === true): ?>
  <?php echo "<hr>"; ?>
  <?php foreach ($_SESSION['event']['errors_details'] as $error): ?>
  <div class="alert alert-danger">
    <?php echo $error; ?>
  </div>
  <?php endforeach ?>
  <?php unset($_SESSION['event']); ?>
<?php endif ?>


<?php if (isset($_SESSION['messages'])): ?>
    <?php echo "<hr>"; ?>
  <?php foreach ($_SESSION['messages'] as $msg): ?>
  <div class="alert alert-success">
    <?php echo $msg; ?>
  </div>
  <?php endforeach ?>
  <?php unset($_SESSION['messages']); ?>
<?php endif ?>