import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError, observable } from 'rxjs';
import { catchError} from 'rxjs/operators';
import { path } from '../config.module';

@Injectable({
  providedIn: 'root'
})
export class PublicacionService {
  private basePath:string = path.path;
  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type':  'application/json'
    })
  };
  
  constructor(private http: HttpClient) { }

  //HANDLE ERROR
  private handleError(error: HttpErrorResponse) {
    if (error.error instanceof ErrorEvent) {
      console.error('Un error ha ocurrido:', error.error.message);
    } else {
      console.error(
      `Backend returned code ${error.status}, ` +
      `body was: `, error.error);
    }
    return throwError(
      'Algo malo sucedio, por favor intentarlo más tarde D:');
  };

  //GET ALL
  getAll() : Observable<any> {
    let url = `${this.basePath}publicacion`;
    return this.http.get(url)
    .pipe(
      catchError(this.handleError)
    );
  }

  //GET SINGLE
  getSingle(id:number) : Observable<any> {
    let url = `${this.basePath}publicacion/${id}`;
    return this.http.get(url)
    .pipe(
      catchError(this.handleError)
    );
  }

  getComentarios(id:number) : Observable<any> {
    let url = `${this.basePath}comentario/${id}`;
    return this.http.get(url)
    .pipe(
      catchError(this.handleError)
    );
  }

  //GET SINGLE
  getMeGusta(idUsuario:number, idPublicacion:number) : Observable<any> {
    let url = `${this.basePath}publicacion/${idUsuario}/${idPublicacion}`;
    return this.http.get(url)
    .pipe(
      catchError(this.handleError)
    );
  }

  //CREATE
  public create(data:any) : Observable<any> {
    let url = `${this.basePath}publicacion`;
    return this.http.post(url, data, this.httpOptions)
    .pipe(
      catchError(this.handleError)
    )
  }

  public createComentario(data:any) : Observable<any> {
    let url = `${this.basePath}comentario`;
    return this.http.post(url, data, this.httpOptions)
    .pipe(
      catchError(this.handleError)
    )
  }

  public createMeGusta(data:any) : Observable<any> {
    let url = `${this.basePath}publicacion/megusta`;
    return this.http.post(url, data, this.httpOptions)
    .pipe(
      catchError(this.handleError)
    )
  }

  //CREATE
  public update(data:any) : Observable<any> {
    let url = `${this.basePath}publicacion/${data.id}`;
    return this.http.put(url, data, this.httpOptions)
    .pipe(
      catchError(this.handleError)
    )
  }

  //DELETE
  public delete(id:number) : Observable<any> {
    let url = `${this.basePath}publicacion/${id}`;
    return this.http.delete(url)
    .pipe(
      catchError(this.handleError)
    );
  }

    //DELETE
    public deleteMeGusta(id:number) : Observable<any> {
      let url = `${this.basePath}publicacion/megusta/${id}`;
      return this.http.delete(url)
      .pipe(
        catchError(this.handleError)
      );
    }

}
