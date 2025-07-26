{
  jq,
  pandoc,
  refsJSON ? ./publications.json,
  runCommand,
}:
runCommand "publications" {buildInputs = [jq pandoc];} ''
  mkdir -p "$out"/{biblatex,bibtex,csljson}
  cd "$out"

  jq --compact-output ".[]" ${refsJSON} | while read ref
  do
    id=$(echo "$ref" | jq --raw-output '.id')
    echo $id
    echo "$ref" > "csljson/$id"
    cat csljson/$id
    pandoc --from=cslyaml --to=biblatex --output "biblatex/$id" <<< "[ $ref ]"
    pandoc --from=cslyaml --to=bibtex   --output "bibtex/$id"   <<< "[ $ref ]"
  done
''
