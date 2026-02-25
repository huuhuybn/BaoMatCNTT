# -*- coding: utf-8 -*-
import re
with open(r'f:\ThacSiHoaBinh\BaoMat\BaoMatCNTT\index.html', 'r', encoding='utf-8') as f:
    html = f.read()

starts = [m.start() for m in re.finditer(r'<div class="page', html)]
pages = []
for i, s in enumerate(starts):
    end = starts[i+1] if i+1 < len(starts) else len(html)
    pages.append(html[s:end])

with open(r'f:\ThacSiHoaBinh\BaoMat\BaoMatCNTT\report.txt', 'w', encoding='utf-8') as out:
    for i, p in enumerate(pages, 1):
        lines = p.count('\n')
        tables = p.count('<table')
        pres = p.count('<pre>')
        cover = 'cover' in p[:80]
        h2s = re.findall(r'<h[12][^>]*>(.*?)</h', p, re.DOTALL)
        titles = []
        for h in h2s[:2]:
            t = re.sub(r'<[^>]+>', '', h).strip()[:50]
            titles.append(t)
        label = 'COVER' if cover else ' | '.join(titles) if titles else '(no heading)'
        out.write(f'P{i:02d}: {lines:3d}L {tables}T {pres}P | {label}\n')
