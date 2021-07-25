# data=""
while read LINE; do
  # data+="$LINE"
  awk -F',' 'BEGIN{print "<table>"} {print "<tr>";for(i=1;i<=NF;i++)print "<td>" $i"</td>";print "</tr>"} END{print "</table>"}'
done
