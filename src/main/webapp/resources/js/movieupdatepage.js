/**
 * 
 */
    $('.searchData').on('change', function(e) {
        $.ajax({
            type: 'get',
            url: 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=9aa25fe7c9573a3d0a125e63313d3f52&movieNm=' + $('#title').val() + '&directorNm=' + $('#director').val(),
            success: function(data) {
                var movieData = data.movieListResult;
                $('.movie-content').remove();
                for (var i = 0; i < movieData.movieList.length; i++) {
                    var movieContent = $('<tr class="movie-content"></tr>');
                    var tdCode = $('<td class="movieCode movie-option">' + movieData.movieList[i].movieCd + '</td>').attr('id', 'movieCode');
                    movieContent.append(tdCode);
                    var tdOption = makeOption(movieData.movieList[i].openDt).attr('id', 'movieOpenDate');
                    movieContent.append(tdOption);
                    tdOption = makeOption(movieData.movieList[i].movieNm).attr('id', 'movieTitle');
                    $(tdOption).attr('class', 'movie-option movie-title');
                    movieContent.append(tdOption);
                    tdOption = makeOption(movieData.movieList[i].genreAlt).attr('id', 'movieGenre');
                    $(tdOption).attr('class', 'movie-option movie-gre');
                    movieContent.append(tdOption);
                    tdOption = makeOption(movieData.movieList[i].nationAlt).attr('id', 'movieNation');
                    movieContent.append(tdOption);
                    tdOption = makeOption(makeDirectorStr(movieData.movieList[i].directors)).attr('id', 'movieDirectors');
                    movieContent.append(tdOption);
                    if ($('#country').val() == '') {
                        $('.movie_container').append(movieContent)
                    } else if ($('#country').val() == '국내') {
                        if (movieData.movieList[i].nationAlt == '한국') {
                            $('.movie_container').append(movieContent)
                        }
                    } else if ($('#country').val() == '국외') {
                        if (movieData.movieList[i].nationAlt != '한국') {
                            $('.movie_container').append(movieContent)
                        }
                    }
                }
                $('.movie-content').on('click', function(e) {
                    $(selectMovie).css({
                        'background-color': '#ffffff'
                    });
                    selectMovie = $(this);
                    $(this).css({
                        'background-color': '#00aaff'
                    });
                    var tdList = $(this).find('td')
                })
            }
        })
    });
var selectMovie = null;

function imageTest(data) {
    var target = $('#fileUpload').clone().appendTo('#form').hide().attr('name', 'imageFiles');
    if (data.files && data.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            var img = $('<img name="image"/>').attr('src', e.target.result).css('height', '100%').on('click', function(e) {
                target.remove();
                $(this).remove();
                $('#fileUpload').val('')
            });
            $('.image-choice').append(img)
        }
        reader.readAsDataURL(data.files[0])
    }
}

function widePostTest(data) {
    var target = $('#widePostUpload').clone().appendTo('#form').hide().attr('name', 'wideposter');
    if (data.files && data.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            var img = $('<img name="image"/>').attr('src', e.target.result).css('width', '100%');
            $('#widePostUpload').on('change', function(e) {
                $(img).remove();
                $(target).remove()
            });
            $('.widepost-choice').append(img)
        }
        reader.readAsDataURL(data.files[0])
    }
}

function postTest(data) {
    var target = $('#postUpload').clone().appendTo('#form').hide().attr('name', 'poster');
    if (data.files && data.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            var img = $('<img name="image"/>').attr('src', e.target.result).css('height', '100%');
            $('#postUpload').on('change', function(e) {
                $(img).remove();
                $(target).remove()
            });
            $('.post_choice').append(img)
        }
        reader.readAsDataURL(data.files[0])
    }
}

function nowDate() {
    var d = new Date();
    return d.getFullYear() + "-" + ("00" + (d.getMonth() + 1)).slice(-2) + "-" + ("00" + d.getDate()).slice(-2) + " " + ("00" + d.getHours()).slice(-2) + ":" + ("00" + d.getMinutes()).slice(-2) + ":" + ("00" + d.getSeconds()).slice(-2)
}

function videoTest(data) {
    var target = $('#fileUpload2').clone().appendTo('#form').hide().attr('name', 'videoFiles');
    if (data.files && data.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            var video = $('<video></video>').attr('src', e.target.result).css('width', '400px').on('click', function(e) {
                target.remove();
                $(this).remove();
                $('#fileUpload2').val('')
            });
            $('.video-choice').append(video)
        }
        reader.readAsDataURL(data.files[0])
    }
}

function makeDirectorStr(data) {
    var str = "";
    for (var i = 0; i < data.length; i++) {
        str += data[i].peopleNm + ","
    }
    return str
}

function makeOption(data) {
    if (data === '') {
        return $('<td class="movie-option">X</td>')
    } else {
        return $('<td class="movie-option">' + data + '</td>')
    }
}

function uploadMovie() {
    if (this.selectMovie == null) {
        alert('영화를 선택하세요.');
        return
    } else if ($("#postUpload").val() == '') {
        alert('메인 포스트를 선택하세요.');
        return
    }
    var movieTitle = $(this.selectMovie).children('#movieTitle').html();
    var movieCode = $(this.selectMovie).children('#movieCode').html();
    var movieOpenDate = $(this.selectMovie).children('#movieOpenDate').html();
    var movieGenre = $(this.selectMovie).children('#movieGenre').html();
    var movieNation = $(this.selectMovie).children('#movieNation').html();
    var movieDirectors = $(this.selectMovie).children('#movieDirectors').html();
    $('form').append($('<input type="text" name="movieName" value="' + movieTitle + '">').hide());
    $('form').append($('<input type="text" name="movieCode" value="' + movieCode + '">').hide());
    $('form').append($('<input type="text" name="movieOpendate" value="' + movieOpenDate + '">').hide());
    $('form').append($('<input type="text" name="movieGenre" value="' + movieGenre + '">').hide());
    $('form').append($('<input type="text" name="movieNation" value="' + movieNation + '">').hide());
    $('form').append($('<input type="text" name="movieDirector" value="' + movieDirectors + '">').hide());
    $('#storyboard').clone().appendTo('#form').hide();
    $.ajax({
        async: false,
        type: 'get',
        url: 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=9aa25fe7c9573a3d0a125e63313d3f52&movieCd=' + movieCode,
        success: function(data) {
            var info = data.movieInfoResult.movieInfo;
            $('form').append($('<input type="text" name="movieRuntime" value="' + info.showTm + '">').hide());
            $('form').append($('<input type="text" name="movieAge" value="' + info.audits[0].watchGradeNm + '">').hide());
            $('form').append($('<input type="text" name="movieActor" value="' + makeDirectorStr(info.actors) + '">').hide())
        }
    });
    $.ajax({
        async: false,
        type: 'get',
        url: 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=9aa25fe7c9573a3d0a125e63313d3f52&targetDt=' + movieOpenDate,
        success: function(data) {
            for (var i = 0; i < data.boxOfficeResult.weeklyBoxOfficeList.length; i++) {
                if (data.boxOfficeResult.weeklyBoxOfficeList[i].movieCd == movieCode) {
                    $('form').append($('<input type="text" name="movieTotalview" value="' + data.boxOfficeResult.weeklyBoxOfficeList[i].audiAcc + '">').hide())
                }
            }
        }
    });
    $('form').submit()
}