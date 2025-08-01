{
  jq,
  pandoc,
  refsJSON,
  runCommand,
}:
runCommand "publications" {buildInputs = [jq pandoc];} ''
  mkdir -p "$out"/{biblatex,bibtex,csljson}
  cd "$out"

  for refs in ${refsJSON}
  do
    jq --compact-output ".[]" $refs | while read -r ref
    do
      id=$(echo "$ref" | jq --raw-output '.id')
      echo $id
      echo "$ref" > "csljson/$id"
      cat csljson/$id
      pandoc --from=csljson --to=biblatex --output "biblatex/$id" <<< "[ $ref ]"
      pandoc --from=csljson --to=bibtex   --output "bibtex/$id"   <<< "[ $ref ]"
    done
  done
''
