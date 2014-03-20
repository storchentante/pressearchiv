#!/bin/sh

. ./sources.sh

snippet() {
  line="$1"
  fname=$(echo $line | cut -d ' ' -f 1)
  fdir=$(echo $fname | cut -c 1-4)
  fbase=content/${fdir}/${fname}
  source=$(eval echo \$$(echo $line | cut -d ' ' -f 2))
  date=$(echo $line | cut -d ' ' -f 3)
  title=$(echo $line | cut -d ' ' -f 4-)

  cat <<-EOF
  <li>
  ${source}, ${date}: <a href="${fbase}.html">${title}</a>
  (
  <a href="${fbase}.png">Image</a>, 
  <a href="${fbase}.txt">Plain text</a>, 
  )
  </li>
EOF
}

cat <<-EOF
<!DOCTYPE html PUBLIC -//W3C//DTD HTML 4.01 Transitional//EN>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Entbindungshaus Gießen, Pressearchiv</title>
</head>
<body>
EOF

cat index.txt | while read article
do
  snippet "$article"
done

cat <<-EOF
</body>
</html>
EOF
