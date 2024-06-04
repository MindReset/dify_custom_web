# 第一阶段：构建阶段
FROM node:18.20.2 AS build

# 安装 pnpm
RUN npm install -g pnpm

# 创建并切换到工作目录
WORKDIR /app

# 复制 package.json 和 pnpm-lock.yaml
COPY package.json pnpm-lock.yaml ./

# 安装所有依赖
RUN pnpm install --reporter ndjson

# 复制项目的其他文件
COPY . .

# 构建项目
RUN pnpm run build

# 确认 .next 目录是否存在
RUN ls -la .next

# 第二阶段：运行阶段
FROM node:18.20.2-alpine

# 创建并切换到工作目录
WORKDIR /app

# 复制 package.json 和 pnpm-lock.yaml
COPY package.json pnpm-lock.yaml ./

# 安装 pnpm 并安装生产依赖
RUN npm install -g pnpm && pnpm install --prod --frozen-lockfile --reporter ndjson

# 从构建阶段复制构建好的文件
COPY --from=build /app/.next ./.next
COPY --from=build /app/public ./public
COPY --from=build /app/package.json ./package.json
COPY --from=build /app/pnpm-lock.yaml ./pnpm-lock.yaml
COPY --from=build /app/.env.local ./.env.local 

# 暴露端口
EXPOSE 3000

# 启动应用
CMD ["pnpm", "start"]