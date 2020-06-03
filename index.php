
<?php
	session_start();
	
	include("cnx1.php");
//*********************************************************************************************************************************************
	if(isset($_POST["btn"])  )
	//if(isset($_POST['pseudo']) AND isset($_POST['pass']))
	{
		$pseudo = $_POST['pseudo'];
	    $mdp	= $_POST['pass'];
		$req1 = $connect->prepare("SELECT * FROM etudiant WHERE pseudo = ? and pass = ?");
		$req1->execute(array($pseudo, $mdp));
		$rst1 = $req1->rowCount();
		if($rst1 == 1)
		{

			$etu                   = $req1->fetch();
			$_SESSION['ID']        = $etu['ID_USER3'];
			$_SESSION['ID_CLASSE'] = $etu['IDCLASSE'];
			$_SESSION['PSEUDO']    = $etu['PSEUDO'];
			$_SESSION['MDP']       = $etu['PASS'];
			$_SESSION['NOM']       = $etu['NOM'];
			$_SESSION['PRENOM']    = $etu['PRENOM'];
			$_SESSION['PRIVILEGE']      = $etu['PRIVILEGE'];
			header("location:etudiant/accueil.php");
				
		}
		else
		{
			$req2 = $connect->prepare("SELECT * FROM enseignant WHERE pseudo = ? and pass = ?");
			$req2->execute(array($pseudo, $mdp));
			$rst2 = $req2->rowCount();
			if($rst2 == 1)
			{
				$ens                   = $req2->fetch();
				$_SESSION['ID']        = $ens['ID_ENSEIGNANT'];
				$_SESSION['PSEUDO']    = $ens['PSEUDO'];
				$_SESSION['MDP']       = $ens['PASS'];
				$_SESSION['NOM']       = $ens['NOM'];
				$_SESSION['PRENOM']    = $ens['PRENOM'];
				$_SESSION['PRIVILEGE']	   = $ens['PRIVILEGE'];
				header("location:enseignant/accueil.php");
			}
			else
			{
				$req3 = $connect->prepare("SELECT * FROM administrateur WHERE pseudo = ? and pass = ?");
				$req3->execute(array($pseudo, $mdp));
				$rst3 = $req3->rowCount();
				if($rst3 == 1)
				{
					$asp                   = $req3->fetch();
					$_SESSION['ID']        = $asp['ID_USER2'];
					$_SESSION['PSEUDO']    = $asp['PSEUDO'];
					$_SESSION['MDP']       = $asp['PASS'];
					$_SESSION['NOM']       = $asp['NOM'];
					$_SESSION['PRENOM']    = $asp['PRENOM'];
					$_SESSION['PRIVILEGE']	   =$asp['PRIVILEGE'];
					header("location:admin/accueil.php");
					
				}
			
				else{
					header('location:index.php?error=1');
				}
			}
		}
	}
//********************************************************************************************************************************************************************
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GESTION SALLES</title>


<link href="css/styles.css" rel="stylesheet">
<link href="LoginCss/style.css" rel="stylesheet">
        

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

</head>

<body>
	<br><br><br>	
		
			<div class="login-panel panel panel-default">
				<div class="box" style="height: 420px;">
						<?php
if (isset($_GET['error']))
{
		echo '<div class="alert bg-danger" role="alert" style="width: 100%;
    height: 50px;">
          <svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> le pseudo ou le mot de passe est incorrecte! <a  class="pull-right" aria-hidden="true"></a>
        </div>' ;

}?>

  
  <div id="header">
  <h1 id="logintoregister">Se Connecter</h1>
  </div> 
   <form enctype="multipart/form-data" method="POST">
    <div class="group">      
      <input class="inputMaterial" type="text" name="pseudo" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Pseudo</label>
    </div>
	    <div class="group">      
      <input class="inputMaterial" type="password" name="pass" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Mot de passe</label>
    </div>
    <button name="btn"  id="buttonlogintoregister" type="submit">Connexion</button>
  </form>
  <div id="footer-box" ><p class="footer-text"><span class="sign-up" >© Copyright SID3 2018</span></p></div>
</div>

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script>
		!function ($) {
			$(document).on("click","ul.nav li.parent > a > span.icon", function(){		  
				$(this).find('em:first').toggleClass("glyphicon-minus");	  
			}); 
			$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
	</script>	
</body>

</html>
