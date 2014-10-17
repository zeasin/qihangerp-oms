using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OC.MVC.Utility
{
    public class PerformanceActionAttribute : ActionFilterAttribute
    {
        public string Message { get; set; }


        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            //在Action执行前执行            

            GetTimer(filterContext, "action").Start();

            base.OnActionExecuting(filterContext);
        }

        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            //在Action执行之后执行
            var actionTimer = GetTimer(filterContext, "action");
            //GetTimer(filterContext, "action").Stop();
            actionTimer.Stop();
            base.OnActionExecuted(filterContext);
            string extime = "页面执行耗时" + actionTimer.ElapsedMilliseconds + "毫秒";
            filterContext.HttpContext.Response.Headers.Add("extime", extime);
            //在这里显示给用户的时间只是action的执行时间，如果在view中有执行调用代码的部分，则时间不会
            //记录在内，所以这里的时间不是很准，但是这个时间可以很自由的被view中的代码调用显示，使得界面可以按照
            //自己的意愿进行显示
        }


        public override void OnResultExecuting(ResultExecutingContext filterContext)
        {
            GetTimer(filterContext, "render").Start();

            base.OnResultExecuting(filterContext);
        }

        public override void OnResultExecuted(ResultExecutedContext filterContext)
        {
            //在Result执行之后            
            //这里使用response.write输出只能是输出到documnet的最后部分，不能按照想法显示到指定的随意位置
            //所以这里隐藏显示了。
            //这这部分使用response.Headers是无效的，因为当执行这部分内容的时候，view已经渲染完了，在这添加到Header
            //中的值，无法在页面获得
            var renderTimer = GetTimer(filterContext, "render");
            renderTimer.Stop();

            var actionTimer = GetTimer(filterContext, "action");
            var response = filterContext.HttpContext.Response;

            if (response.ContentType == "text/html")
            {
                response.Write(
                    String.Format(
                        "<p id='pidtimeelapse' style='display:none;'>Action '{0} :: {1}', Execute: {2}ms, Render: {3}ms.</p>",
                        filterContext.RouteData.Values["controller"],
                        filterContext.RouteData.Values["action"],
                        actionTimer.ElapsedMilliseconds,
                        renderTimer.ElapsedMilliseconds
                    )
                );

            }

            base.OnResultExecuted(filterContext);
        }



        private Stopwatch GetTimer(ControllerContext context, string name)
        {
            string key = "__timer__" + name;
            if (context.HttpContext.Items.Contains(key))
            {
                return (Stopwatch)context.HttpContext.Items[key];
            }

            var result = new Stopwatch();
            context.HttpContext.Items[key] = result;
            return result;
        }
    }
}