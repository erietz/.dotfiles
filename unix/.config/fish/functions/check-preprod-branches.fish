function check-preprod-branches
  git log main..preprod --oneline | \
    sed -n 's/.*Merge pull request.*from.*\/\(.*\)/\1/p' | \
    sort | uniq | \
    xargs -n1 -I {} git log preprod..{}
end
