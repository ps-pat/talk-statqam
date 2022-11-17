import Lineage;

settings.outformat = "pdf";

unitsize(1cm);

bool[][] types = {{false, true, true},
                  {false, true, false},
                  {false, false, false}};

Arg arg = Arg(types[0]);
arg.newleaf(types[1], 1);
arg.newleaf(types[2], 1);

arg.coalesce(0, 1);
arg.coalesce(2, 3);

arg.draw();

real yleaves = 0;
real[] xleaves = {1.75, 8.6, 15.5};

label(scale(5) * "\( \varphi^* = ? \)", position = (xleaves[0], yleaves - 0.35));
label(scale(5) * "\( \varphi_1 = 0 \)", position = (xleaves[1], yleaves - 0.35));
label(scale(5) * "\( \varphi_2 = 1 \)", position = (xleaves[2], yleaves - 0.35));

label(scale(2) * "\( h_0^* \)", position = (xleaves[0], -1.35));
label(scale(2) * "\( h_0^1 \)", position = (xleaves[1], -1.35));
label(scale(2) * "\( h_0^2 \)", position = (xleaves[2], -1.35));

path brace_sample = brace((18, -1.5), (-1, -1.5), 19 * 0.05);
draw(brace_sample, p = black + 4pt);
label(scale(3) * "\( H_0^* \)",
      position = shift(0, -1) * midpoint(brace_sample));
label(scale(3) * "\( \Phi \)",
      position = shift(-0.1, -0.85) * midpoint(brace_sample));

path brace_genealogy = brace((18, 9.5), (18, 0.75));
draw(brace_genealogy, p = black + 4pt);
label(scale(3) * "\( G \)",
      position = shift(0.75, 0) * midpoint(brace_genealogy));

path brace_t4 = brace((-1, 0.75), (-1, 3.5));
draw(brace_t4, p = black + 4pt);
label(scale(3) * "\( t_4 \)",
      position = shift(-0.75, 0) * midpoint(brace_t4));

path brace_t5 = brace((-2.5, 0.75), (-2.5, 7.75));
draw(brace_t5, p = black + 4pt);
label(scale(3) * "\( t_5 \)",
      position = shift(-0.75, 0) * midpoint(brace_t5));
