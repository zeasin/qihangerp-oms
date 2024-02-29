import request from "@/utils/request";
import { AxiosPromise } from "axios";
import { OrderQuery, OrderVo, ResultVo } from "./types";
export function listOrder(queryParams: OrderQuery): AxiosPromise<any> {
  return request({
    url: "/api/tao-api/goods/list",
    method: "get",
    params: queryParams,
  });
}
