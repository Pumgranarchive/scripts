include Makefile.options

NAME=		fiche_suivi

PDF=		$(NAME).pdf
OUTNAME=	$(PROMO)_Suivi_$(MONTH)_$(YEAR).pdf
TEX=		$(NAME).tex
TEMPLATE=	$(NAME).template
LATEX=		pdflatex

all:		$(NAME).pdf

re:		clean all

$(PDF):		$(TEX)
		$(LATEX) $(NAME)
		mv $@ $(OUTNAME)

$(TEX):		Makefile.options $(TEMPLATE)
		sed -e "s/\%\%TEAM\%\%/$(TEAM)/g" -e "s/\%\%SUBJECT\%\%/$(SUBJECT)/g" -e "s/\%\%BACKGROUND\%\%/$(BACKGROUND)/g" -e "s/\%\%LOGO\%\%/$(LOGO)/g" -e "s/\%\%TEACHER\%\%/$(TEACHER)/g" -e "s#\%\%DATE\%\%#$(DATE)#g" -e "s/\%\%TIME\%\%/$(TIME)/g" -e "s/\%\%LEADER\%\%/$(LEADER)/g" -e "s/\%\%PRESENT\%\%/$(PRESENT)/g" -e "s/\%\%MISSING\%\%/$(MISSING)/g" -e "s/\%\%PROGRESS\%\%/$(PROGRESS)/g" -e "s/\%\%QUESTIONS\%\%/$(QUESTIONS)/g" $(TEMPLATE) > $@

submit:		$(PDF)
		cp $(OUTNAME) $(SVN_FOLDER)/$(RENDU_FOLDER)/.
		(cd $(SVN_FOLDER) && svn up && svn add $(RENDU_FOLDER)/$(OUTNAME) && svn commit -m "$(MSG)")

clean:
		rm -f $(NAME).pdf *.aux *.log *.out *.tex