// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){

});

function fetchMovie(title) {
	//url = "http://imdbapi.org?q=" + title;
	url = "http://www.omdbapi.com/?t=" + title + "&tomatoes=true&plot=full"
	$.ajax({
		url: url,
		dataType: "json",
		success: function(data){
			console.log(data);
			$("#movie_year").attr("value", data.Year);
			$("#movie_imdb").attr("value", data.imdbRating);
			$("#movie_freshness").attr("value", data.tomatoMeter);
			$("#movie_notes").html(data.Plot);
			$("#movie_cover").attr("value", data.Poster);
			$("#cover_img").attr("src", data.Poster);
			$("#movie_lead_actor").attr("value", data.Actors);
			$("#movie_director").attr("value", data.Director);
			$("#movie_screenwriter").attr("value", data.Writer);
		}
	});
}

function fetchBook(title) {
	//url = "http://imdbapi.org?q=" + title;
	url = "https://www.googleapis.com/books/v1/volumes?q=" + title
	$.ajax({
		url: url,
		dataType: "json",
		success: function(data){
			console.log(data);
			data = data.items[0].volumeInfo
			$("#book_year").attr("value", data.publishedDate);
			$("#book_average_rating").attr("value", data.averageRating);
			$("#book_review_count").attr("value", data.ratingsCount);
			$("#book_notes").html(data.description);
			$("#book_cover").attr("value", data.imageLinks.thumbnail);
			$("#book_img").attr("src", data.imageLinks.thumbnail);
			$("#book_author").attr("value", data.authors[0]);
			$("#book_page_count").attr("value", data.pageCount);
			//$("#movie_screenwriter").attr("value", data.Writer);
		}
	});
}
function foo(data) {
	console.log(data);
}
function goodreads(title) {
	key = "7FL5oPyDYoCxcttrrDn2OA";
	secret = "YH3zd3tKkYemjaNvmCFxtrSsV4EWUVv2woKQQVIMfc";
	url = "http://www.goodreads.com/search.xml?q=" + title + "&key=" + key;	
	$.ajax({
		url: url,
		method: 'get',
		dataType: "jsonp text",
		success: function(data){
			
			console.log($.parseXML(data));
			data = data.items[0].volumeInfo
			$("#book_year").attr("value", data.publishedDate);
			$("#book_average_rating").attr("value", data.averageRating);
			$("#book_review_count").attr("value", data.ratingsCount);
			$("#book_notes").html(data.description);
			$("#book_cover").attr("value", data.imageLinks.thumbnail);
			$("#book_img").attr("src", data.imageLinks.thumbnail);
			$("#book_author").attr("value", data.authors[0]);
			$("#book_page_count").attr("value", data.pageCount);
			
		}
	});

}