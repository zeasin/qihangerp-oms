export interface OrderQuery {
  pageIndex: number;
  pageSize: number;
  orderNum?: string;
}

export interface ResultVo {
  code: number;
  msg: string;
  records?: OrderVo[];
  total?: number;
}

export interface OrderVo {
  id: number;
}
