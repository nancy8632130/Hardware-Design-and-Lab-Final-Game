
`define do_h  32'd524 // B LOW
`define re_h  32'd588 // B LOW
`define mi_h  32'd660 // C sharp
`define fa_h  32'd698 // B LOW
`define so_h  32'd784 // B LOW
`define la_h  32'd880 // B LOW
`define si_h  32'd988 // B LOW

`define Do  32'd262 // B LOW
`define re 32'd294// B LOW
`define mi  32'd330 // C sharp
`define fa  32'd349 // B LOW
`define so  32'd392 // B LOW
`define la  32'd440 // B LOW
`define si  32'd494 // B LOW

`define do_l 32'd131 // B LOW
`define re_l 32'd147// B LOW
`define mi_l  32'd165 // C sharp
`define fa_l  32'd174 // B LOW
`define so_l  32'd196 // B LOW
`define la_l  32'd220 // B LOW
`define si_l  32'd247 // B LOW


//`define NME   32'd330 // E
//`define NMFs  32'd370 // F sharp
//`define NMGs  32'd415 // G sharp
//`define NMA   32'd440 // A
//`define NMB   32'd494 // B
//`define NMCsH 32'd554 // C sharp HIGH
`define NM0   32'd20000 //slience (over freq.)

module Musicmain (
	input [7:0] ibeatNum,	
	output reg [31:0] tone
);

always @(*) begin
	case (ibeatNum)		// 1/4 beat
		8'd0 : tone = `mi;	
		8'd1 : tone = `mi;
		8'd2 : tone = `mi;
		8'd3 : tone = `mi;
		
		
		8'd4 : tone = `la_l;
		8'd5 : tone = `la_l;
		8'd6 : tone = `mi_l;
		8'd7 : tone = `mi_l;
		
		8'd8 : tone = `la_l;
		8'd9 : tone = `la_l;
		8'd10 : tone = `mi_l;
		8'd11 : tone = `mi_l;
		8'd12 : tone = `la_l;
		8'd13 : tone = `la_l;
		8'd14 : tone = `mi_l;
		8'd15 : tone = `mi_l;
/////////////////////////////////////////////////
		
		8'd16 : tone = `la_l;
		8'd17 : tone = `la_l;
		8'd18 : tone = `mi_l;
		8'd19 : tone = `mi_l;
		8'd20 : tone = `la_l;
		8'd21 : tone = `la_l;
		8'd22 : tone = `mi_l;
		8'd23 : tone = `mi_l;
		
		8'd24 : tone = `la_l;
		8'd25 : tone = `la_l;
		8'd26 : tone = `mi_l;
		8'd27 : tone = `mi_l;
		8'd28 : tone = `la_l;
		8'd29 : tone = `la_l;
		8'd30 : tone = `mi_l;
		8'd31 : tone = `mi_l;
////////////////////////////////////////////
		
		8'd32 : tone = `la_l;
		8'd33 : tone = `la_l;
		8'd34 : tone = `mi_l;
		8'd35 : tone = `mi_l;
		
		//end of line two
		8'd36 : tone = `la_h;
		8'd37 : tone = `la_h;
		8'd38 : tone = `NM0;
		8'd39 : tone = `NM0;
		
		8'd40 : tone = `mi_h;
		8'd41 : tone = `mi_h;
		8'd42 : tone = `la;
		8'd43 : tone = `la;
		8'd44 : tone = `NM0;
		8'd45 : tone = `NM0;
		8'd46 : tone = `mi_h;
		8'd47 : tone = `mi_h;
/////////////////////////////////////////////////
		
		8'd48 : tone = `mi_h;
		8'd49 : tone = `mi_h;
		8'd50 : tone = `do_h;
		8'd51 : tone = `do_h;
		8'd52 : tone = `re_h;
		8'd53 : tone = `re_h;
		8'd54 : tone = `mi_h;
		8'd55 : tone = `mi_h;
		
		8'd56 : tone = `so_h;
		8'd57 : tone = `so_h;
		8'd58 : tone = `mi_h;
		8'd59 : tone = `mi_h;
		8'd60 : tone = `NM0;
		8'd61 : tone = `NM0;
		8'd62 : tone = `so_h;
		8'd63 : tone = `so_h;
///////////////////////////////////////////////////
		
		8'd64 : tone = `fa_h;
		8'd65 : tone = `fa_h;
		
		//end of 3
		8'd66 : tone = `la_l;
		8'd67 : tone = `la_l;
		8'd68 : tone = `mi_l;
		8'd69 : tone = `mi_l;
		8'd70 : tone = `la_l;
		8'd71 : tone = `la_l;
		
		8'd72 : tone = `mi_l;
		8'd73 : tone = `mi_l;
		8'd74 : tone = `la_l;
		8'd75 : tone = `la_l;
		8'd76 : tone = `mi_l;
		8'd77 : tone = `mi_l;
		8'd78 : tone = `la_l;
		8'd79 : tone = `la_l;
/////////////////////////////////////////////////
		
		8'd80 : tone = `mi_l;
		8'd81 : tone = `mi_l;
		8'd82 : tone = `do_l;
		8'd83 : tone = `do_l;
		8'd84 : tone = `so_l;
		8'd85 : tone = `so_l;
		8'd86 : tone = `Do;
		8'd87 : tone = `Do;
		
		8'd88 : tone = `so_l;
		8'd89 : tone = `so_l;
		8'd90 : tone = `do_l;
		8'd91 : tone = `do_l;
		8'd92 : tone = `so_l;
		8'd93 : tone = `so_l;
		8'd94 : tone = `Do;
		8'd95 : tone = `Do;
///////////////////////////////////////////////////
		
		8'd96 : tone = `so_l;
		8'd97 : tone = `so_l;
		//end of 4
		8'd98 : tone = `re_h;
		8'd99 : tone = `re_h;
		8'd100 : tone = `mi_h;
		8'd101 : tone = `mi_h;
		8'd102 : tone = `re_h;
		8'd103 : tone = `re_h;
		
		8'd104 : tone = `do_h;
		8'd105 : tone = `do_h;
		8'd106 : tone = `la;
		8'd107 : tone = `la;
		8'd108 : tone = `NM0;
		8'd109 : tone = `NM0;
		8'd110 : tone = `so;
		8'd111 : tone = `so;
/////////////////////////////////////////////////
		
		8'd112 : tone = `la;
		8'd113 : tone = `la;
		8'd114 : tone = `do_h;
		8'd115 : tone = `do_h;
		8'd116 : tone = `re_h;
		8'd117 : tone = `re_h;
		8'd118 : tone = `mi_h;
		8'd119 : tone = `mi_h;
		
		8'd120 : tone = `re_h;
		8'd121 : tone = `re_h;
		8'd122 : tone = `do_h;
		8'd123 : tone = `do_h;
		8'd124 : tone = `NM0;
		8'd125 : tone = `NM0;
		8'd126 : tone = `re_h;
		8'd127 : tone = `re_h;
///////////////////////////////////////////////////
        
        8'd128 : tone = `la;
        8'd129 : tone = `la;
        //end of 5
        8'd130 : tone = `re_l;
        8'd131 : tone = `re_l;
        8'd132 : tone = `la_l;
        8'd133 : tone = `la_l;
        8'd134 : tone = `re;
        8'd135 : tone = `re;
        8'd136 : tone = `la_l;
        8'd137 : tone = `la_l;
        8'd138 : tone = `re_l;
        8'd139 : tone = `re_l;
        8'd140 : tone = `la_l;
        8'd141 : tone = `la_l;
        8'd142 : tone = `re;
        8'd143 : tone = `re;
        8'd144 : tone = `la_l;
        8'd145 : tone = `la_l;
        8'd146 : tone = `fa_l;
        8'd147 : tone = `fa_l;
        8'd148 : tone = `do_l;
        8'd149 : tone = `do_l;
        8'd150 : tone = `fa_l;
        8'd151 : tone = `fa_l;
        8'd152 : tone = `do_l;
        8'd153 : tone = `do_l;
        8'd154 : tone = `so_l;
        8'd155 : tone = `so_l;
        8'd156 : tone = `re_l;
        8'd157 : tone = `re_l;
        
        8'd158 : tone = `so_l;
        8'd159 : tone = `so_l;
        8'd160 : tone = `re_l;
        8'd161 : tone = `re_l;
        
        //end of 6
        8'd162 : tone = `la;
        8'd163 : tone = `la;
        8'd164 : tone = `la;
        8'd165 : tone = `la;
        8'd166 : tone = `do_h;
        8'd167 : tone = `do_h;
        8'd168 : tone = `la;
        8'd169 : tone = `la;
        
        8'd170 : tone = `NM0;
        8'd171 : tone = `NM0;
        8'd172 : tone = `so;
        8'd173 : tone = `so;
        8'd174 : tone = `la;
        8'd175 : tone = `la;
        8'd176 : tone = `la;
        8'd177 : tone = `la;
        8'd178 : tone = `la;
        8'd179 : tone = `la;
        
        8'd180 : tone = `NM0;
        8'd181 : tone = `NM0;
        8'd182 : tone = `mi_h;
        8'd183 : tone = `mi_h;
        8'd184 : tone = `NM0;
        8'd185 : tone = `NM0;
        8'd186 : tone = `so;
        8'd187 : tone = `so;
        8'd188 : tone = `la;
        8'd189 : tone = `la;
        
        //end of 7
        8'd190 : tone = `la_l;
        8'd191 : tone = `la_l;
        8'd192 : tone = `mi_l;
        8'd193 : tone = `mi_l;
        8'd194 : tone = `la_l;
        8'd195 : tone = `la_l;
        8'd196 : tone = `mi_l;
        8'd197 : tone = `mi_l;
        8'd198 : tone = `la_l;
        8'd199 : tone = `la_l;
        
        8'd200 : tone = `mi_l;
        8'd201 : tone = `mi_l;
        8'd202 : tone = `la_l;
        8'd203 : tone = `la_l;
        8'd204 : tone = `mi_l;
        8'd205 : tone = `mi_l;
       
        8'd206 : tone = `la_l;
        8'd207 : tone = `la_l;
        8'd208 : tone = `mi_l;
        8'd209 : tone = `mi_l;
        
         8'd210 : tone = `la_l;
         8'd211 : tone = `la_l;
         8'd212 : tone = `mi_l;
         8'd213 : tone = `mi_l;
         
         8'd214 : tone = `la_l;
         8'd215 : tone = `la_l;
         8'd216 : tone = `mi_l;
         8'd217 : tone = `mi_l;
         
         8'd218 : tone = `la_l;
         8'd219 : tone = `la_l;
         8'd220 : tone = `mi_l;
         8'd221 : tone = `mi_l;
         
         //end of8
         
         8'd222 : tone = `la;
         8'd223 : tone = `la;
         8'd224 : tone = `la;
         8'd225 : tone = `la;
         8'd226 : tone = `NM0;
         8'd227 : tone = `NM0;
         8'd228 : tone = `do_h;
         8'd229 : tone = `do_h;
         8'd230 : tone = `NM0;
         8'd231 : tone = `NM0;
         8'd232 : tone = `NM0;
         8'd233 : tone = `so;
         8'd234 : tone = `so;
         8'd235 : tone = `la;
         8'd236 : tone = `la;
         
         8'd237 : tone = `la;
         8'd238 : tone = `la;
         8'd239 : tone = `mi_h;
         8'd240 : tone = `mi_h;
         8'd241 : tone = `la;
         8'd242 : tone = `la;
         8'd243 : tone = `so;
         8'd244 : tone = `so;
         8'd245 : tone = `la;
         8'd246 : tone = `la;
         8'd247 : tone = `do_h;
         8'd248 : tone = `do_h;
         8'd249 : tone = `la;
         8'd250 : tone = `la;
         8'd251 : tone = `mi_h;
         8'd252 : tone = `mi_h;
         //end of 9
         8'd253 : tone = `la_l;
         8'd254 : tone = `la_l;
         8'd255 : tone = `mi_l;
         8'd256 : tone = `mi_l;
         8'd257 : tone = `la_l;
         8'd258 : tone = `la_l;
         8'd259 : tone = `mi_l;
         8'd260 : tone = `mi_l;
         8'd261 : tone = `la_l;
         8'd262 : tone = `la_l;
         8'd263 : tone = `mi_l;
         8'd264 : tone = `mi_l;
         8'd265 : tone = `la_l;
         8'd266 : tone = `la_l;
         8'd267 : tone = `mi_l;
         8'd268 : tone = `mi_l;
         
         8'd269 : tone = `la_l;
         8'd270 : tone = `la_l;
         8'd271 : tone = `mi_l;
         8'd272 : tone = `mi_l;
         8'd273 : tone = `la_l;
         8'd274 : tone = `la_l;
         8'd275 : tone = `mi_l;
         8'd276 : tone = `mi_l;
         
         8'd277 : tone = `la_l;
         8'd278 : tone = `la_l;
         8'd279 : tone = `mi_l;
         8'd280 : tone = `mi_l;
         
         8'd281 : tone = `la_l;
         8'd282 : tone = `la_l;
         8'd283 : tone = `mi_l;
         8'd284 : tone = `mi_l;
         
         //end of10
         8'd285 : tone = `la_h;
         8'd286 : tone = `la_h;
         8'd287 : tone = `NM0;
         8'd288 : tone = `NM0;
         8'd289 : tone = `mi_h;
         8'd290 : tone = `mi_h;
         8'd291 : tone = `mi_h;
         8'd292 : tone = `mi_h;
         8'd293 : tone = `la;
         8'd294 : tone = `la;
         8'd295 : tone = `NM0;
         8'd296 : tone = `NM0;
         8'd297 : tone = `mi_h;
         8'd298 : tone = `mi_h;
         8'd299 : tone = `mi_h;
         8'd300 : tone = `mi_h;
         
         8'd300 : tone = `do_h;
         8'd301 : tone = `do_h;
         8'd302 : tone = `re_h;
         8'd303 : tone = `re_h;
         8'd304 : tone = `mi_h;
         8'd305 : tone = `mi_h;
         8'd306 : tone = `so_h;
         8'd307 : tone = `so_h;
         
         8'd308 : tone = `mi_h;
         8'd309 : tone = `mi_h;
         8'd310 : tone = `NM0;
         8'd311 : tone = `NM0;
         8'd312 : tone = `so_h;
         8'd313 : tone = `so_h;
         8'd314 : tone = `fa_h;
         8'd315 : tone = `fa_h;
         
         //end of 11
         8'd316 : tone = `la_l;
         8'd317 : tone = `la_l;
         8'd318 : tone = `mi_l;
         8'd319 : tone = `mi_l;
         8'd320 : tone = `la_l;
         8'd321 : tone = `la_l;
         8'd322 : tone = `mi_l;
         8'd323 : tone = `mi_l;
         
         8'd324 : tone = `la_l;
         8'd325 : tone = `la_l;
         8'd326 : tone = `mi_l;
         8'd327 : tone = `mi_l;
         8'd328 : tone = `la_l;
         8'd329 : tone = `la_l;
         8'd330 : tone = `mi_l;
         8'd331 : tone = `mi_l;
         8'd332 : tone = `la_l;
         8'd333 : tone = `la_l;
         8'd334 : tone = `mi_l;
         8'd335 : tone = `mi_l;
         
         8'd336 : tone = `do_l;
         8'd337 : tone = `do_l;
         8'd338 : tone = `so_l;
         8'd339 : tone = `so_l;
         8'd340 : tone = `Do;
         8'd341 : tone = `Do;
         8'd342 : tone = `so_l;
         8'd343 : tone = `so_l;
         
         8'd344 : tone = `do_l;
         8'd345 : tone = `do_l;
         8'd346 : tone = `so_l;
         8'd347 : tone = `so_l;
         8'd348 : tone = `Do;
         8'd349 : tone = `Do;
         
         
         
		default : tone = `NM0;
	endcase
end

endmodule
		
		
		
		