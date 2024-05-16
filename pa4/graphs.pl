% graph 1: unweighted
edge(a,b,1).
edge(a,e,1).
edge(b,c,1).
edge(b,g,1).
edge(b,d,1).
edge(b,e,1).
edge(c,e,1).
edge(c,d,1).
edge(d,e,1).
edge(d,g,1).
edge(e,f,1).
edge(f,g,1).
edge(f,h,1).

% graph 2: unweighted
edge(i,j,1).
edge(i,l,1).
edge(j,k,1).
edge(k,l,1).

% graph 3: weighted
edge(m,n,1).
edge(m,r,3).
edge(n,r,4).
edge(n,o,3).
edge(n,q,5).
edge(o,q,4).
edge(o,p,1).
edge(p,q,2).
edge(q,r,2).

graph([a,b,c,d,e,f,g,h]).
graph([i,j,k,l]).
graph([m,n,o,p,q,r]).
