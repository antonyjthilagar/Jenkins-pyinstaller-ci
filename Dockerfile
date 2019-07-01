FROM python:3

ADD ./dist /dist

RUN pip install pystrich

EXPOSE 8000

CMD [ "/dist/server" ]
