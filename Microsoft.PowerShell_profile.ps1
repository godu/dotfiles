function neuron
{
  $dockerArgs = $()
  $matchedArgs = $args.Where({$_ -like "-*S*"})
  $args = $args.Where({$_ -notlike "-*S*"})
  If ($matchedArgs.Count -gt 0) {
    $dockerArgs = $("-p", "8080:8080")

    $args = $args + ($matchedArgs | % ({$_ -replace "S", ""})).Where({$_ -ne "-"})
    $args += "-s"
    $args += "0.0.0.0:8080"
  }
  docker run --rm -it $dockerArgs -v "$(pwd):/zettelkasten" -w /zettelkasten sridca/neuron neuron $args
}
