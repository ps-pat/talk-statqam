// Load kitten pics.
real picwidth = 100;
string[] cats = new string[3];
for (int k = 0; k < 3; ++k) {
    string fpath = "cat" + string(k + 1) + ".jpg";
    string options = "scale = 1, width = " + string(picwidth) + "pt";
    cats[k] = graphic(fpath, options);
}

// Set various parameters.
pair[] leaf = {(-1.5 * picwidth, 0), (0, 0), (1.5 * picwidth, 0)};
pair[] coal_vertex = new pair[2];
coal_vertex[0] = (leaf[0].x / 2, picwidth);
coal_vertex[1] = ((coal_vertex[0].x + leaf[2].x) / 2, 2.5 * picwidth);

pen edge = rgb("e65100") + linewidth(5pt);

pair[] parenshift = new pair[2];
parenshift[0] = (-0.8 * picwidth, 0.8 * picwidth);
parenshift[1] = (-parenshift[0].x, parenshift[0].y);
pair[] parens = {shift(parenshift[0]) * leaf[0],
                 shift(parenshift[1]) * leaf[2]};

picture[] cats_tree = new picture[2];
for (int k = 0; k < 2; ++k) {
    // Initialize pictures
    cats_tree[k] = new picture;
    size(cats_tree[k], 6 * picwidth, 3 * picwidth);
    unitsize(cats_tree[k], 1pt, 1pt);

    // Draw trees
    draw(leaf[0] -- coal_vertex[0], p = edge, pic = cats_tree[k]);
    draw(leaf[1] -- coal_vertex[0], p = edge, pic = cats_tree[k]);
    draw(coal_vertex[0] -- coal_vertex[1], p = edge, pic = cats_tree[k]);
    draw(leaf[2] -- coal_vertex[1], p = edge, pic = cats_tree[k]);

    // Draw Pr()
    label(scale(10) * "Pr", position = shift(-125, 0) * parens[0],
          pic = cats_tree[k]);
    label(scale(40) * "(", position = parens[0], pic = cats_tree[k]);
    label(scale(40) * ")", position = parens[1], pic = cats_tree[k]);
}

// Draw leaves
for (int k = 0; k < 3; ++k) {
    // Tree 1
    label(cats[k], leaf[k], S, pic = cats_tree[0]);

    //Tree 2
    label(cats[2 - k], leaf[k], S, pic = cats_tree[1]);
}


for (int k = 0; k < 2; ++k) {
    string prefix = "cats-tree" + string(k + 1) + "-prob";
    string format = "png";
    shipout(pic = cats_tree[k], prefix = prefix, format = format);

    string filename = prefix + "." + format;
    system("convert -trim " + filename + " " + filename);
}
