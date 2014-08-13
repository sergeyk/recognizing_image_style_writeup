# First, compile the paper normally to get the .bbl file

# Then, inline everything, including .bbl, into one file
latexpand --expand-bbl paper.bbl --output paper_expanded.tex paper.tex

# Copy all used figures into figures/
rm -r figures
mkdir figures
cd ../../figures
grep -oe "../../figures/[^}]*" ../bmvc14/paper/paper_expanded.tex | sed 's/..\/..\/figures\///' | xargs -I {} rsync -R {} ../bmvc14/paper/figures/

# Change paths to local in the paper
cd ../bmvc14/paper
sed 's/..\/..\/figures/figures/' paper_expanded.tex > paper_expanded_final.tex

# Now compiling paper works super fine. Let's tar stuff up.
tar -cvf arxiv.tar paper_expanded_final.tex bmvc2k* figures/

# Clean up
rm -r figures
rm paper_expanded.tex
rm paper_expanded_final.tex
