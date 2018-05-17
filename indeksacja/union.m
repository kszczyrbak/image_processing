function tab_return = union(id, p, q)

tab_return = id;

if p > q
    tab_return(root(id, q)) = root(id, p);
else
    tab_return(root(id,p)) = root(id,q);
end