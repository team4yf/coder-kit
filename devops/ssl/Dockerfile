FROM nginx:alpine
COPY ./entrypoint.sh /usr/sbin
ENTRYPOINT [ "/usr/sbin/entrypoint.sh" ]
CMD ["nginx", "-g", "daemon off;"]