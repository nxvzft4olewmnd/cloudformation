import{s as h}from"./service.541fc1e6.js";import{_ as l,G as _,r as f,o as s,c as m,w as p,a as g,b as o,t as a,e as c}from"./index.c6e72b79.js";const y={name:"Portainer",mixins:[h],props:{item:Object},components:{Generic:_},data:()=>({endpoints:null,containers:null}),computed:{running:function(){return this.containers?this.containers.filter(e=>e.State.toLowerCase()==="running").length:""},dead:function(){return this.containers?this.containers.filter(e=>e.State.toLowerCase()==="dead").length:""},misc:function(){return this.containers?this.containers.filter(e=>e.State.toLowerCase()!=="running"&&e.State.toLowerCase()!=="dead").length:""}},created(){this.fetchStatus()},methods:{fetchStatus:async function(){const e={"X-Api-Key":this.item.apikey};this.endpoints=await this.fetch("/api/endpoints",{headers:e}).catch(n=>{console.error(n)});let i=[];for(let n of this.endpoints){if(this.item.environments&&!this.item.environments.includes(n.Name))continue;const d=`/api/endpoints/${n.Id}/docker/containers/json?all=1`,r=await this.fetch(d,{headers:e}).catch(t=>{console.error(t)});r&&(i=i.concat(r))}this.containers=i}}},k={class:"notifs"},v={key:0,class:"notif running",title:"Running"},w={key:1,class:"notif dead",title:"Dead"},C={key:2,class:"notif misc",title:"Other (creating, paused, exited, etc.)"};function x(e,i,n,d,r,t){const u=f("Generic");return s(),m(u,{item:n.item},{indicator:p(()=>[g("div",k,[t.running>0?(s(),o("strong",v,a(t.running),1)):c("",!0),t.dead>0?(s(),o("strong",w,a(t.dead),1)):c("",!0),t.misc>0?(s(),o("strong",C,a(t.misc),1)):c("",!0)])]),_:1},8,["item"])}const G=l(y,[["render",x],["__scopeId","data-v-36a39228"]]);export{G as default};
