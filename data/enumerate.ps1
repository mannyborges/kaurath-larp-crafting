# sample parsing of SOR in powershell
# Install-Module -Name PSYaml  # -RequiredVersion 1.0.2   # version is likely not needed 
#
#
#

$data = Get-Content -Path ./recipes.yaml -Raw | ConvertFrom-Yaml  # 

foreach ($recipe in $data.recipes) 
  {
  write-host  ("Name: {0} ID: {1}"                              -f $recipe.name,
                                                                   $recipe.id   ) -ForegroundColor Yellow
  write-host  ("Type: {0} Level: {1}  Requires Attunement: {2}" -f $recipe.type,
                                                                   $recipe.levelname,   
                                                                   $recipe.attunment) -ForegroundColor Yellow                                    

  write-host ("  RECIPE - C:{0} U:{1} R:{2} E:{3} S:{4} p:{5} " -f  $recipe.recipe.common,
                                                                    $recipe.recipe.uncommon,
                                                                    $recipe.recipe.rare,
                                                                    $recipe.recipe.exotic,
                                                                    $recipe.recipe.special,
                                                                    $recipe.recipe.plot     ) -ForegroundColor Green
  write-host "  Prequisite" 
  foreach ($preq in $recipe.recipe.prereq )
    {  
         
        if ($preq.id -eq '') 
          { 
          write-host "    NONE" -ForegroundColor Red
          }
        else 
          {
          Write-Host ("    {0} ID: {1} " -f $preq.name,
                                                           $preq.id    ) -ForegroundColor Red
          }
    }   
  
  } 
write-host "pause" 
